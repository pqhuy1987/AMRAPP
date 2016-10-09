//
//  Workoutlog_ViewController.h
//  Timer
//
//  Created by Sprobit on 15/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface Workoutlog_ViewController : UIViewController
{
    NSMutableArray *array_log;
    
    IBOutlet UITableView *tbl_log;
}
@end
