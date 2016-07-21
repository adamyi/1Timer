//
//  ViewController.m
//  1Timer
//
//  Created by YiXuan on 7/20/16.
//  Copyright © 2016 Adam Yi. All rights reserved.
//

#import "ViewController.h"

BOOL started = FALSE;
BOOL timeup = FALSE;
int timeLeft = 60;
int totalTimeMinute = 10;
int totalTimeSecond = 0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)start:(id)sender {
    if (started) {
        started = FALSE;
        [_startButton setTitle:@"Start"];
    }
    else {
        //NSLog(@"%d %d %d %d %d", timeLeft, [self initialIndividual], (totalTimeMinute * 60 + totalTimeSecond), totalTimeMinute, totalTimeSecond);
        if (timeup && [self initialIndividual] > (totalTimeMinute * 60 + totalTimeSecond)) {
            [self reset:nil];
        }
        started = TRUE;
        [_startButton setTitle:@"Pause"];
        [self tick:nil];
    }
}

- (IBAction)next:(id)sender {
    started = FALSE;
    [_startButton setTitle:@"Start"];
    timeLeft = [self initialIndividual];
    [self updateLabel];
}

- (IBAction)reset:(id)sender {
    started = FALSE;
    [_startButton setTitle:@"Start"];
    timeLeft = [self initialIndividual];
    totalTimeMinute = [self initialMinute];
    totalTimeSecond = [self initialSecond];
    [self updateLabel];
}

- (int)initialIndividual {
    int ret = [[_initialIndividualTextField stringValue] intValue];
    if ( ret <= 0)
        ret = [[_initialTimeTextField stringValue] intValue];
    return ret;
}

- (int)initialMinute {
    return [[_initialTimeTextField stringValue] intValue] / 60;
}

- (int)initialSecond {
    return [[_initialTimeTextField stringValue] intValue] % 60;
}

- (int)alarmTime {
    return [[_alarmTimeTextField stringValue] intValue];
}

-(void) updateLabel {
    NSString *timeLeftStr = [NSString stringWithFormat:@"%i", timeLeft];
    NSString *totalTime = [NSString stringWithFormat:@"%02i : %02i", totalTimeMinute, totalTimeSecond];
    [_timeLeftTextField setStringValue:timeLeftStr];
    [_totalTimeLeftTextField setStringValue:totalTime];
}

- (void) tick:(id)sender {
    if (started)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [self performSelector:@selector(tick:) withObject:nil afterDelay:1.0];
        //[self ]
        //[NSOperationQueue reque]
        //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1ull*NSEC_PER_SEC), dispatch_get_main_queue(), ^{[self tick:nil];});
        if (totalTimeMinute <= 0 && totalTimeSecond <= 0)
        {
            NSSound *sound = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"time_over" ofType:@"wav"] byReference:NO];
            [sound play];
            //[sound release];
            started = FALSE;
            [_startButton setTitle:@"Start"];
            timeup = TRUE;
            return;
        }
        if (timeLeft <= 0)
        {
            NSSound *sound = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"time_over" ofType:@"wav"] byReference:NO];
            [sound play];
            //[sound release];
            started = FALSE;
            [_startButton setTitle:@"Start"];
            timeLeft = [self initialIndividual];
            //[self updateLabel];
            timeup = TRUE;
            return;
        }
        timeup = FALSE;
        timeLeft --;
        totalTimeSecond --;
        if (totalTimeSecond < 0)
        {
            totalTimeSecond = 59;
            totalTimeMinute --;
        }
        [self updateLabel];
        if (timeLeft == [self alarmTime]) {
            NSSound *sound = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"buzzer" ofType:@"wav"] byReference:NO];
            [sound play];
        }
    }
}

@end
