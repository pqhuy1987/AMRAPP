//
//  AppDelegate.h
//  Timer
//
//  Created by Sprobit on 13/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DBConnection.h"


#import "Amrap_ViewController.h"
#import "Home_ViewController.h"
#import "Deathby_ViewController.h"
#import "Roundfortime_ViewController.h"
#import "Roundfortimerounds_ViewController.h"
#import "Timerscreen_ViewController.h"
#import "workoutresult_ViewController.h"
#import "Workoutlog_ViewController.h"

#import "DeathTimer_ViewController.h"



#import "PLABElegantTimePicker.h"

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) UINavigationController *navCon;
@property BOOL restrictRotation;

@property (nonatomic,retain) NSMutableDictionary *dic_result;


-(void) restrictRotation:(BOOL) restriction;

@end

