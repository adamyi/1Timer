//
//  TimerStatus.m
//  1Timer
//
//  Created by Adam Yi on 09/09/2017.
//  Copyright © 2017 Adam Yi. All rights reserved.
//
//  Use of this source code is governed by a MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

#import "TimerStatus.h"

@implementation TimerStatus

+ (TimerStatus*)sharedInstance
{
    static TimerStatus* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
