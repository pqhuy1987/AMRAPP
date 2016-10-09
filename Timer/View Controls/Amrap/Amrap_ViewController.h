//
//  Amrap_ViewController.h
//  Timer
//
//  Created by Sprobit on 13/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "PLABElegantTimePicker.h"


@interface Amrap_ViewController : UIViewController <PLABElegantTimePickerDelegate>
{
    IBOutlet UITextField *txt_time;
    IBOutlet UITextField *txt_round;
    IBOutlet UITextField *txt_counter;
    IBOutlet UIButton *start;
    NSTimer *timer;
    NSInteger remainingCounts;
    
    IBOutlet UIDatePicker *picker;
    IBOutlet UIView *view_picker;
    
    BOOL istimecap;
    
    
    IBOutlet UILabel *lbl_time;
    IBOutlet UILabel *lbl_counter;
    
    IBOutlet UIView *view_counter;
    
    NSString *str_counter;
    
    
}
@end
