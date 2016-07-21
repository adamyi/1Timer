//
//  AppDelegate.m
//  1Timer
//
//  Created by YiXuan on 7/20/16.
//  Copyright © 2016 Adam Yi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSLog(@"1Timer - A simple MUN timer for Mac OS.\nProudly released by Adam Yi. Under MIT License.");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
