//
//  workoutresult_ViewController.h
//  Timer
//
//  Created by Sprobit on 14/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface workoutresult_ViewController : UIViewController
{
    IBOutlet UILabel *lbl_name;
    IBOutlet UILabel *lbl_time;
    IBOutlet UILabel *lbl_rounds;
    IBOutlet UILabel *lbl_reps;
    
    IBOutlet UITextView *txt_note;
    
    IBOutlet UIButton *btn_save;
    
    IBOutlet UIView *view_BothBtn;
    
    IBOutlet UIButton *btn_Edit;
    
    
    IBOutlet UIButton *timer_select;
    IBOutlet UITextField *txt_reps;
    IBOutlet UITextField *txt_round;
    
    IBOutlet UIDatePicker *picker;
    IBOutlet UIView *view_picker;
    
    
}
@property (nonatomic,retain) NSMutableDictionary *dic_select;
@end
