//
//  TimerViewController.m
//  1Timer
//
//  Created by YiXuan on 7/20/16.
//  Copyright © 2016 - 2017 Adam Yi.
//
//  Use of this source code is governed by a MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

#import "TimerViewController.h"
#import "TimerStatus.h"

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[TimerStatus sharedInstance] setStarted:FALSE];
    [[TimerStatus sharedInstance] setTimeup:FALSE];
    [[TimerStatus sharedInstance] setIndividualTime:60];
    [[TimerStatus sharedInstance] setTotalTime:[[Time alloc] initWithMinutes:10 seconds:0]];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)start:(id)sender {
    [[[self view] window] makeFirstResponder:nil];
    if ([[TimerStatus sharedInstance] started]) {
        [[TimerStatus sharedInstance] setStarted:FALSE];
        [_startButton setTitle:@"Start"];
    }
    else {
        //NSLog(@"%d %d %d %d %d", timeLeft, [self initialIndividual], (totalTimeMinute * 60 + totalTimeSecond), totalTimeMinute, totalTimeSecond);
        if ([[TimerStatus sharedInstance] timeup] && [self initialIndividual] > [[[TimerStatus sharedInstance] totalTime] totalSeconds]) {
            [self reset:nil];
        }
        [[TimerStatus sharedInstance] setStarted:TRUE];
        [_startButton setTitle:@"Pause"];
        [self tick:nil];
    }
}

- (IBAction)next:(id)sender {
    [[[self view] window] makeFirstResponder:nil];
    [[TimerStatus sharedInstance] setStarted:FALSE];
    [_startButton setTitle:@"Start"];
    [[TimerStatus sharedInstance] setIndividualTime:[self initialIndividual]];
    [self updateLabel];
}

- (IBAction)reset:(id)sender {
    [[[self view] window] makeFirstResponder:nil];
    [[TimerStatus sharedInstance] setStarted:FALSE];
    [_startButton setTitle:@"Start"];
    [[TimerStatus sharedInstance] setIndividualTime:[self initialIndividual]];
    [[TimerStatus sharedInstance] setTotalTime:[[Time alloc] initWithSeconds:[self initialTotalSeconds]]];
    [self updateLabel];
}

- (int)initialTotalSeconds {
    return [[_initialTimeTextField stringValue] intValue];
}

- (int)initialMinute {
    return [self initialTotalSeconds] / 60;
}

- (int)initialSecond {
    return [self initialTotalSeconds] % 60;
}

- (int)initialIndividual {
    int ret = [[_initialIndividualTextField stringValue] intValue];
    if ( ret <= 0)
        ret = [self initialTotalSeconds];
    return ret;
}

- (int)alarmTime {
    return [[_alarmTimeTextField stringValue] intValue];
}

-(void) updateLabel {
    NSString *timeLeftStr = [NSString stringWithFormat:@"%i", [[TimerStatus sharedInstance] individualTime]];
    NSString *totalTime = [[[TimerStatus sharedInstance] totalTime] toString];
    [_timeLeftTextField setStringValue:timeLeftStr];
    [_totalTimeLeftTextField setStringValue:totalTime];
}

- (void) tick:(id)sender {
    if ([[TimerStatus sharedInstance] started])
    {
        int individualTime = [[TimerStatus sharedInstance] individualTime];
        Time *totalTime = [[TimerStatus sharedInstance] totalTime];
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [self performSelector:@selector(tick:) withObject:nil afterDelay:1.0];
        //[self ]
        //[NSOperationQueue reque]
        //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1ull*NSEC_PER_SEC), dispatch_get_main_queue(), ^{[self tick:nil];});
        if (totalTime.totalSeconds <= 0)
        {
            NSSound *sound = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"time_over" ofType:@"wav"] byReference:NO];
            [sound play];
            //[sound release];
            [[TimerStatus sharedInstance] setStarted:FALSE];
            [_startButton setTitle:@"Start"];
            [[TimerStatus sharedInstance] setTimeup:TRUE];
            return;
        }
        if (individualTime <= 0)
        {
            NSSound *sound = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"time_over" ofType:@"wav"] byReference:NO];
            [sound play];
            //[sound release];
            [[TimerStatus sharedInstance] setStarted:FALSE];
            [_startButton setTitle:@"Start"];
            [[TimerStatus sharedInstance] setIndividualTime:[self initialIndividual]];
            //[self updateLabel];
            [[TimerStatus sharedInstance] setTimeup:TRUE];
            return;
        }
        [[TimerStatus sharedInstance] setTimeup:FALSE];
        [[TimerStatus sharedInstance] setIndividualTime: individualTime - 1];
        [totalTime minusOneSecond];
        [self updateLabel];
        if (individualTime == [self alarmTime]) {
            NSSound *sound = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"buzzer" ofType:@"wav"] byReference:NO];
            [sound play];
        }
    }
}

@end
