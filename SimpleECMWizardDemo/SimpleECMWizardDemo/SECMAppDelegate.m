//
//  SECMAppDelegate.m
//  SimpleECMWizardDemo
//
//  Created by Tsen Fong Chung Lee on 7/2/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "SECMAppDelegate.h"

@implementation SECMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /** Load and verify your license files here
    NSData *license = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"license" ofType:@""]];
    NSData *signature = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"license" ofType:@"signed"]];
    [SECMLicense verifyLicense:license withSignedLicense:signature];
     */
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
