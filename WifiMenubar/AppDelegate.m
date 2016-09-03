//
//  AppDelegate.m
//  WifiMenubar
//
//  Created by Paker on 03/26/15.
//  Copyright (c) 2015 Paker. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreWLAN/CoreWLAN.h>

@interface AppDelegate ()
@property (strong, nonatomic) NSStatusItem *statusItem;
@end

@implementation AppDelegate {
    NSMenuItem *ssidItem;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];

    NSMenu *menu = [[NSMenu alloc] init];
    ssidItem = [menu addItemWithTitle:@"" action:nil keyEquivalent:@""];
    [menu addItem:[NSMenuItem separatorItem]];
    [menu addItemWithTitle:@"Quit" action:@selector(quit:) keyEquivalent:@""];
    _statusItem.menu = menu;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshSSID) userInfo:nil repeats:YES];
}

-(void)refreshSSID{
    [_statusItem setTitle:[CWWiFiClient sharedWiFiClient].interface.wlanChannel.channelBand==kCWChannelBand5GHz?@"5Ghz":@"2Ghz"];
    ssidItem.title = [CWWiFiClient sharedWiFiClient].interface.ssid;
}

-(void)quit:(id)sender {
    [NSApp terminate:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)darkMode {
    NSString * value = (__bridge NSString *)(CFPreferencesCopyValue((CFStringRef)@"AppleInterfaceStyle", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost));
    return [value isEqualToString:@"Dark"];
}

@end
