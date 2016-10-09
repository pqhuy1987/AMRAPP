//
//  Roundfortimerounds_ViewController.h
//  Timer
//
//  Created by Sprobit on 15/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface Roundfortimerounds_ViewController : UIViewController
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
    
    BOOL is_round;
    NSInteger contround;
    NSInteger lestime;
    NSTimer *timer_counttep;
    
    
    BOOL blinkStatus;
    NSInteger blinkingtime;
    NSTimer *blankingtimer;
    
     BOOL stopBlinking;
    
    NSString *total_time;
    NSString *total_second;
    
}
@property (nonatomic,strong)  NSString *time;
@property (nonatomic,strong)  NSString *second;
@property (nonatomic,strong)  NSString *round;

@property (nonatomic,strong)  NSString *reps;

@property (nonatomic,strong)  NSString *countdown;

@end
