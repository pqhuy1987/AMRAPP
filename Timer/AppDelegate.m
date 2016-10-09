//
//  AppDelegate.m
//  Timer
//
//  Created by Sprobit on 13/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//
#import "Home_ViewController.h"
#import "AppDelegate.h"
@import GoogleMobileAds;
@import FirebaseAnalytics;
@import Firebase;

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate

@synthesize restrictRotation;
@synthesize dic_result;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    Home_ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Home_ViewController"];
    _navCon = [[UINavigationController alloc]initWithRootViewController:vc];
    _navCon.navigationBar.translucent=NO;
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    
    dic_result=[[NSMutableDictionary alloc] init];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [FIRApp configure];
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-5722562744549789~3487737357"];
    
   // [_navCon.navigationBar setTitleTextAttributes:
    // @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [ApplicationDelegate.navCon.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor colorWithRed:255/255.0 green:94/255.0 blue:51/255.0 alpha:1]}];
    
    
    //root
    self.window.rootViewController = _navCon;

        return YES;
}



-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    if(self.restrictRotation)
        return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
    else
        return UIInterfaceOrientationMaskPortrait;
}

-(void) restrictRotation:(BOOL) restriction
{
    restrictRotation = restriction;
}

/*- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}*/
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view

@end
