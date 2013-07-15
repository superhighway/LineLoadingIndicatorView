//
//  CCAppDelegate.m
//  LineLoadingIndicatorView
//
//  Created by Nia Mutiara on 15/7/13.
//  Copyright (c) 2013 Cat Cyborg. All rights reserved.
//

#import "CCLineLoadingIndicatorView.h"
#import "CCAppDelegate.h"

@interface CCAppDelegate ()
@property (nonatomic, weak) CCLineLoadingIndicatorView *loadingIndicatorView;
@end

@implementation CCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    CCLineLoadingIndicatorView *loadingIndicatorView = [[CCLineLoadingIndicatorView alloc] initWithFrame:CGRectMake(0, 30, self.window.frame.size.width, 2)];
    [self.window addSubview:loadingIndicatorView];
    [loadingIndicatorView animateOnceWithDuration:0.8];
    self.loadingIndicatorView = loadingIndicatorView;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Animate" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectMake(0, 160, self.window.frame.size.width, 64);
    [button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)didTapButton {
    [self.loadingIndicatorView animateOnceWithDuration:1];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
