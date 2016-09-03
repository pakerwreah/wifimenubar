//
//  main.m
//  WifiMenubar
//
//  Created by Paker on 03/26/15.
//  Copyright (c) 2015 Paker. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    
    NSApplication * application = [NSApplication sharedApplication];
    
    AppDelegate *appDelegate = [[AppDelegate alloc] init];
    
    [application setDelegate:appDelegate];
    [application run];
    
    return EXIT_SUCCESS;
}
