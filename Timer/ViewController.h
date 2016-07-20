//
//  ViewController.h
//  1Timer
//
//  Created by YiXuan on 7/20/16.
//  Copyright © 2016 Adam Yi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController


@property (weak) IBOutlet NSTextField *timeLeftTextField;
@property (weak) IBOutlet NSTextField *totalTimeLeftTextField;
@property (weak) IBOutlet NSButton *startButton;
@property (weak) IBOutlet NSButton *nextButton;
@property (weak) IBOutlet NSButton *resetButton;
@property (weak) IBOutlet NSTextField *initialIndividualTextField;
@property (weak) IBOutlet NSTextField *initialTimeTextField;
@property (weak) IBOutlet NSTextField *alarmTimeTextField;

- (IBAction)start:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)reset:(id)sender;


@end

