//
//  TimerViewController.h
//  1Timer
//
//  Created by YiXuan on 7/20/16.
//  Copyright © 2016 Adam Yi.
//
//  Use of this source code is governed by a MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

#import <Cocoa/Cocoa.h>

@interface TimerViewController : NSViewController


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

