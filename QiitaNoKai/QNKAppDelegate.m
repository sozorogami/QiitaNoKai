//
//  QNKAppDelegate.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "QNKAppDelegate.h"
#import "QNKItemsViewController.h"

@implementation QNKAppDelegate

#pragma mark - UIApplicationDelegate Protocol Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    QNKItemsViewController *itemsViewController = [QNKItemsViewController new];
    self.window.rootViewController =
        [[UINavigationController alloc] initWithRootViewController:itemsViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
