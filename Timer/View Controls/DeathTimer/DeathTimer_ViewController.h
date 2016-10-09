//
//  DeathTimer_ViewController.h
//  AMRAPP
//
//  Created by Hemant on 08/09/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface DeathTimer_ViewController : UIViewController
{
    NSInteger remainingCounts;
    NSInteger remainingsecond;
    NSInteger noround;
    
    NSTimer *timer;
    IBOutlet UILabel *lbl_timer;
    
    BOOL is_settimecap;
    
    IBOutlet UILabel *lbl_info;
    IBOutlet UIView *view_button;
    
    IBOutlet UIView *view_result;
    
    IBOutlet UILabel *lbl_push;
    IBOutlet UILabel *lbl_complet;
    
    
    NSInteger tapincreas;
    IBOutlet UILabel *lbl_tapcount;
    IBOutlet UILabel *lbl_counter;
     NSTimer *timer_countdown;
    
    NSInteger remainingdown;
    
    
    
    BOOL is_round;
    NSInteger contround;
    NSInteger lestime;
    NSTimer *timer_counttep;
    
    
    BOOL blinkStatus;
    NSInteger blinkingtime;
    NSTimer *blankingtimer;
    
    
     NSTimer *timer_oneMinute;
    BOOL iscompletOne;
    
    BOOL issecondtime;
    
    BOOL startoneminute;
    
    BOOL stopBlinking;
    
    NSInteger oneMinutes;
    
     NSInteger failWorkout;
    
     BOOL Nextround;
    
}
@property (nonatomic,strong)  NSString *time;
@property (nonatomic,strong)  NSString *second;
@property (nonatomic,strong)  NSString *round;

@property (nonatomic,strong)  NSString *countdown;

@end
