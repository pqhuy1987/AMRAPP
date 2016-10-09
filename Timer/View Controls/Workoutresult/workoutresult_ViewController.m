//
//  workoutresult_ViewController.m
//  Timer
//
//  Created by Sprobit on 14/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import "Home_ViewController.h"


@interface workoutresult_ViewController ()

@end

@implementation workoutresult_ViewController
@synthesize dic_select;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
   
    
    
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    
    self.title=@"WORKOUT RESULT";
    
     view_picker.hidden=YES;
    txt_reps.hidden=YES;
    txt_round.hidden=YES;
    timer_select.hidden=YES;
   
    
    
    
    if ([dic_select valueForKey:@"name"])
    {
        
        self.navigationItem.hidesBackButton = NO;
        
        UIButton *backImageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        [backImageBtn setBackgroundImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        [backImageBtn addTarget:self action:@selector(backview:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithCustomView:backImageBtn];
        self.navigationItem.leftBarButtonItem = backBtn;
        
        
        btn_save.hidden=YES;
        lbl_name.text=[dic_select valueForKey:@"name"];
        lbl_time.text=[NSString stringWithFormat:@"%@",[dic_select valueForKey:@"time"]];
        lbl_rounds.text=[[dic_select valueForKey:@"round"] stringValue];
        lbl_reps.text=[[dic_select valueForKey:@"reps"] stringValue];
        
        NSString *str_note=[dic_select valueForKey:@"notes"];
        
        if (![str_note isEqualToString:@"(null)"])
        {
            txt_note.text=[dic_select valueForKey:@"notes"];
        }
        else
        {
            txt_note.text=@"";
        }
        
        view_BothBtn.hidden=NO;
        
        txt_reps.text=lbl_reps.text;
        txt_round.text=lbl_rounds.text;
        
        
        
        NSDate *date = [NSDate new]; // Split up the date components
        NSDateComponents *time = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date]; NSInteger seconds = ([time hour] * 60 * 60) + ([time minute] * 60);
        [picker setDatePickerMode:UIDatePickerModeCountDownTimer];
        [picker setCountDownDuration:seconds];
        
        NSString *myString = lbl_time.text;
        
         NSArray *yourWords = [myString componentsSeparatedByString:@":"];
        
          NSInteger hh= [[yourWords firstObject] integerValue];
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        
        if (hh>=24)
        {
            myString = @"00:30";
            dateFormatter.dateFormat = @"hh:mm";
        }
        else if(hh>=12)
        {
           // myString = @"00:30";
            dateFormatter.dateFormat = @"hh:mm";
        }
        else
        {
            if (hh==0)
            {
                dateFormatter.dateFormat = @"hh:mm";
            }
            
            
        }
        
        if ([yourWords count]==3)
        {
            dateFormatter.dateFormat = @"HH:mm:ss";
        }
        else
        {
            if (hh>=12)
            {
                myString = @"00:30";
                dateFormatter.dateFormat = @"hh:mm";
            }
            else
            {
                dateFormatter.dateFormat = @"hh:mm";
            }
            
        }
        
        NSDate *yourDate = [dateFormatter dateFromString:myString];
        //dateFormatter.dateFormat = @"HH:mm";
        [picker setDate:yourDate];
        [picker setValue:[UIColor whiteColor] forKey:@"textColor"];
        
        
    }
    else
    {
        
         self.navigationItem.hidesBackButton = YES;
        
        btn_save.hidden=NO;
        
        lbl_name.text=[ApplicationDelegate.dic_result valueForKey:@"workout_name"];
        lbl_time.text=[ApplicationDelegate.dic_result valueForKey:@"time"];
        lbl_rounds.text=[ApplicationDelegate.dic_result valueForKey:@"rounds"];
        lbl_reps.text=[ApplicationDelegate.dic_result valueForKey:@"reps"];
        
        view_BothBtn.hidden=YES;
        
    }
    
   
    
    // Do any additional setup after loading the view.
}
-(IBAction)backview:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    [ApplicationDelegate restrictRotation:NO];
}

-(IBAction)Edit:(id)sender
{
    
    if ([btn_Edit.titleLabel.text isEqualToString:@"Edit"])
    {
        
        lbl_reps.hidden=YES;
        lbl_rounds.hidden=YES;
        
        timer_select.hidden=NO;
        txt_reps.hidden=NO;
        txt_round.hidden=NO;
        [btn_Edit setTitle:@"Save" forState:UIControlStateNormal];
    }
    else
    {
        
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MMMM"];
        
        NSLog(@"Current Date: %@", [formatter stringFromDate:[NSDate date]]);
        
        NSString *str_date =[formatter stringFromDate:[NSDate date]];
        
        // NSString *str_updateid=[NSString stringWithFormat:@"%@",[dicupdate valueForKey:@"rID"]];
         NSString *editName = [NSString stringWithFormat:@"UPDATE Workout SET time = '%@',round = '%@' ,reps = '%@' ,notes = '%@' ,Date = '%@' WHERE id = '%@'",lbl_time.text,txt_round.text,txt_reps.text,txt_note.text,str_date,[dic_select valueForKey:@"id"]];
        
        
         [DBConnection executeQuery:editName];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"WorkOut updated successfully" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
         [alert show];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
        
    }
    
  
    
    
    
   
    
}

-(IBAction)Delete:(id)sender
{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Delete WorkOut"
                                  message:@"Are you sure you want to delete this WorkOut ?"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Cancel"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    //Handel your yes please button action here
                                    [self dismissViewControllerAnimated:YES completion:nil];
                                    
                                }];
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Delete"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Handel no, thanks button
                                   NSString *deleteData = [NSString stringWithFormat: @"DELETE FROM Workout WHERE id = '%@' ",[dic_select valueForKey:@"id"]];
                                   [DBConnection executeQuery:deleteData];
                                   
                                [self.navigationController popToRootViewControllerAnimated:YES];
                                   
                                   
                                   [self.navigationController popViewControllerAnimated:YES];
                                   
                               }];
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
    
  
    
}


-(IBAction)SaveResult:(id)sender
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MMMM"];
    
    NSLog(@"Current Date: %@", [formatter stringFromDate:[NSDate date]]);
    
    NSString *str_date =[formatter stringFromDate:[NSDate date]];
    
    
    
    NSString *insertData = [NSString stringWithFormat: @"INSERT INTO Workout ('name','time','round','reps','notes','Date') VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", lbl_name.text, lbl_time.text,lbl_rounds.text,lbl_reps.text,txt_note.text,str_date];
    
    [DBConnection executeQuery:insertData];
    
    
    UIStoryboard *work =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Workoutlog_ViewController *timescreen = [work instantiateViewControllerWithIdentifier:@"Workoutlog_ViewController"];
    [self.navigationController pushViewController:timescreen animated:YES];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
-(IBAction)Home:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)timeEdit:(id)sender
{
    [txt_note resignFirstResponder];
    [txt_reps resignFirstResponder];
    [txt_round resignFirstResponder];
    
    view_picker.hidden=NO;
    
}
-(IBAction)canceldate:(id)sender
{
  
    view_picker.hidden=YES;
    
}
-(IBAction)Donepiker:(id)sender
{
    
    
    view_picker.hidden=YES;
    
    NSDate *chosen = [picker date];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
    
    NSString *formatedDate = [dateFormatter stringFromDate:chosen];
    NSDate *date = [dateFormatter dateFromString: formatedDate];
    NSDateFormatter * datesecond = [[NSDateFormatter alloc] init];
    [datesecond setDateFormat:@"HH:mm"];
    
    NSString *convertedString = [datesecond stringFromDate:date];
    
   
    lbl_time.text=convertedString;
   
    
    
    NSString *myString = @"00:30";
    NSDateFormatter* timeformat = [[NSDateFormatter alloc] init];
    timeformat.dateFormat = @"HH:mm";
    NSDate *yourDate = [timeformat dateFromString:myString];
    //dateFormatter.dateFormat = @"HH:mm";
    
    [picker setDate:yourDate];
    
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    view_picker.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
