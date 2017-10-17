//
//  TimerStatus.h
//  1Timer
//
//  Created by Adam Yi on 09/09/2017.
//  Copyright © 2017 Adam Yi. All rights reserved.
//
//  Use of this source code is governed by a MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

#import <Foundation/Foundation.h>
#import "Time.h"

@interface TimerStatus : NSObject

@property (nonatomic) BOOL started;
@property (nonatomic) BOOL timeup;
@property (nonatomic) int individualTime;
@property (nonatomic) Time* totalTime;
@property (nonatomic) NSMutableDictionary *stopWatches;

+ (TimerStatus*)sharedInstance;

@end
