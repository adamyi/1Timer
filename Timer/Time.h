//
//  Time.h
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

@interface Time : NSObject

@property (nonatomic) int totalSeconds;
@property (nonatomic) int compoundMinutes;
@property (nonatomic) int compoundSeconds;

- (id) initWithSeconds:(int)seconds;
- (id) initWithMinutes:(int)minutes seconds:(int)seconds;
- (id) minusOneSecond;
- (id) addOneSecond;
- (NSString *) toString;

@end
