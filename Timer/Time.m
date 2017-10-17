//
//  Time.m
//  1Timer
//
//  Created by Adam Yi on 09/09/2017.
//  Copyright © 2017 Adam Yi. All rights reserved.
//
//  Use of this source code is governed by a MIT-style
//  license that can be found in the LICENSE file or at
//  https://opensource.org/licenses/MIT.
//

#import "Time.h"

@implementation Time

- (id) initWithSeconds:(int)seconds {
    self = [super init];
    if (self)
    {
        self.totalSeconds = seconds;
        self.compoundSeconds = seconds % 60;
        self.compoundMinutes = seconds / 60;
    }
    return self;
}

- (id) initWithMinutes:(int)minutes seconds:(int)seconds {
    self = [super init];
    if (self)
    {
        self.totalSeconds = minutes * 60 + seconds;
        self.compoundSeconds = seconds;
        self.compoundMinutes = minutes;
    }
    return self;
}

- (id) minusOneSecond {
    _totalSeconds--;
    _compoundSeconds--;
    if (_compoundSeconds < 0)
    {
        _compoundSeconds = 59;
        _compoundMinutes--;
    }
    
    return self;
}

- (id) addOneSecond {
    _totalSeconds++;
    _compoundSeconds++;
    if (_compoundSeconds == 60)
    {
        _compoundSeconds = 0;
        _compoundMinutes++;
    }
    
    return self;
}

- (NSString *) toString {
    return [NSString stringWithFormat:@"%02i : %02i", _compoundMinutes, _compoundSeconds];
}

@end
