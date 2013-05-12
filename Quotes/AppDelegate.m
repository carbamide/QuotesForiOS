//
//  CMQAppDelegate.m
//  Quotes
//
//  Created by Josh Barrow on 5/12/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"555vKMBZlXi0ivPmyx2sioMsTJuLX8DGLQxfUdAn" clientKey:@"OH0Alrqpnge1GmvwDlAl7sytyaN1107U3iMwkDsK"];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
