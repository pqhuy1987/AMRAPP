//
//  Amrap_ViewController.m
//  Timer
//
//  Created by Sprobit on 13/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//


#import "Amrap_ViewController.h"


#define NUMBERS_ONLY @"1234567890:"
#define CHARACTER_LIMIT 10

@interface Amrap_ViewController ()

@end

@implementation Amrap_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"AMRAP";
    
    
    view_picker.hidden=YES;
     view_counter.hidden=YES;
    
     self.navigationItem.hidesBackButton = YES;
     [picker setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    istimecap=false;
    
    UIColor *color = [UIColor whiteColor];
    txt_time.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"00:00" attributes:@{NSForegroundColorAttributeName: color}];
    txt_round.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"00" attributes:@{NSForegroundColorAttributeName: color}];
    
    txt_counter.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"00:10" attributes:@{NSForegroundColorAttributeName: color}];
    
 
    lbl_counter.text=@"00:10";

    dispatch_async(dispatch_get_main_queue(), ^{
        
      
        
     
        
        // Do any additional setup after loading the view.
       
        // Do any additional setup after loading the view.
        
        NSDate *date = [NSDate new]; // Split up the date components
        NSDateComponents *time = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date]; NSInteger seconds = ([time hour] * 60 * 60) + ([time minute] * 60);
        //  UIDatePicker *picker = [UIDatePicker new];
        [picker setDatePickerMode:UIDatePickerModeCountDownTimer];
        [picker setCountDownDuration:seconds];
        // [[self view] addSubview:picker];
        // [picker setValue:[UIColor colorWithRed:174/255.0f green:174/255.0f blue:174/255.0f alpha:1.0f] forKeyPath:@"textColor"];
        
        NSString *myString = @"00:30";
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        NSDate *yourDate = [dateFormatter dateFromString:myString];
        //dateFormatter.dateFormat = @"HH:mm";
        
        [picker setDate:yourDate];
        
        //  NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        
         [picker setValue:[UIColor whiteColor] forKey:@"textColor"];
       
        
        
        
        PLABElegantTimePicker* v = [[PLABElegantTimePicker alloc] initWithFrame:CGRectMake(0, 40, 320, 130) withHourIndex:0 andMinIndex:30];
        v.delegate = self;
        [view_counter addSubview:v];
        
        
       
        
    });
    
   
}

-(IBAction)canceldate:(id)sender
{
    NSString *myString = @"00:30";
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSDate *yourDate = [dateFormatter dateFromString:myString];
    //dateFormatter.dateFormat = @"HH:mm";
    
    [picker setDate:yourDate];
    
    [self.view endEditing:YES];
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
    
    if (istimecap)
    {
        lbl_time.text=convertedString;
    }
    else
    {
        //lbl_counter.text=convertedString;
    }
    
    
    NSString *myString = @"00:10";
    NSDateFormatter* timeformat = [[NSDateFormatter alloc] init];
    timeformat.dateFormat = @"HH:mm";
    NSDate *yourDate = [timeformat dateFromString:myString];
    //dateFormatter.dateFormat = @"HH:mm";
    
    [picker setDate:yourDate];
    
    
}

-(IBAction)cancelCounter:(id)sender
{

    view_counter.hidden=YES;
}
-(IBAction)DoneCounter:(id)sender
{
    if (str_counter.length==0)
    {
        str_counter=@"00:30";
    }
    lbl_counter.text=str_counter;
    view_counter.hidden=YES;
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    [ApplicationDelegate restrictRotation:NO];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)start
{
    if([lbl_time.text isEqualToString:@"00:00"])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please select Set Time Cap" delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
        [alert show];
        return ;
    }
    else
    {
        if([lbl_counter.text isEqualToString:@"00:00"])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please select Countdown to Start" delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
            [alert show];
            return ;
        }
        else if(txt_round.text.length==0)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please Enter Reps Per Round" delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
            [alert show];
            return ;
        }
        
        
        [ApplicationDelegate restrictRotation:YES];
        
        NSArray *yourWords = [lbl_time.text componentsSeparatedByString:@":"];
        
        
       
        
        UIStoryboard *work =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        Timerscreen_ViewController *timescreen = [work instantiateViewControllerWithIdentifier:@"Timerscreen_ViewController"];
        [self.navigationController pushViewController:timescreen animated:YES];
        
        timescreen.time = [yourWords firstObject];
        timescreen.second = [yourWords lastObject];
        
        timescreen.round=txt_round.text;
        timescreen.countdown=lbl_counter.text;
        
        
        [ApplicationDelegate.dic_result setObject:@"AMRAP" forKey:@"workout_name"];
        [ApplicationDelegate.dic_result setObject:lbl_time.text forKey:@"time"];
        
        [ApplicationDelegate.dic_result setObject:@"0" forKey:@"rounds"];
        [ApplicationDelegate.dic_result setObject:txt_round.text forKey:@"reps"];
        [ApplicationDelegate.dic_result setObject:lbl_counter.text forKey:@"countdown"];
        
        // timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        
      //  NSArray *yourWords = [lbl_counter.text componentsSeparatedByString:@":"];
        
     //   NSInteger hh= [[yourWords firstObject] integerValue];
      //  NSInteger mm= [[yourWords lastObject] integerValue];
        
      //  remainingCounts=hh *60;
        
      //  remainingCounts = (remainingCounts)+ mm;
      
        
    //    remainingCounts =[lbl_counter.text integerValue];
      
    }
}

-(NSString *)formatTimeFromSeconds:(int)numberOfSeconds
{
    
    int seconds = numberOfSeconds % 60;
    int minutes = (numberOfSeconds / 60) % 60;
    int hours = numberOfSeconds / 3600;
    
    //we have >=1 hour => example : 3h:25m
    if (hours)
    {
        return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes,seconds];
    }
    //we have 0 hours and >=1 minutes => example : 3m:25s
    
    if (minutes)
    {
        return [NSString stringWithFormat:@"%00.02d:%2d",  minutes, seconds];
    }
    //we have only seconds example : 25s
    
    return [NSString stringWithFormat:@"%00.02d : %02d", minutes,seconds];
}

-(void)countDown
{
    if(--remainingCounts ==0)
    {
        [timer invalidate];
        
        NSArray *yourWords = [lbl_time.text componentsSeparatedByString:@":"];
        
        
        UIStoryboard *work =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        Timerscreen_ViewController *timescreen = [work instantiateViewControllerWithIdentifier:@"Timerscreen_ViewController"];
        [self.navigationController pushViewController:timescreen animated:YES];
       
        timescreen.time = [yourWords firstObject];
        timescreen.second = [yourWords lastObject];
        
        timescreen.round=txt_round.text;

    }
   // lbl_counter.text=[NSString stringWithFormat: @"00 : %0.2ld",(long)remainingCounts];
    
    NSString *str=[self formatTimeFromSeconds:(int)remainingCounts];
    lbl_counter.text=[NSString stringWithFormat: @"%@",str];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    /*if ((txt_time==textField) || (txt_round==textField))
    {
        NSUInteger newLength = [txt_time.text length] + [string length] - range.length;
        
       
        
        
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS_ONLY] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        if (txt_time==textField)
        {
            if(newLength == 3)
            {
                txt_time.text=[NSString stringWithFormat:@"%@:%@",txt_time.text,string];
            }
        }
        
        while (newLength < CHARACTER_LIMIT)
        {
            
            return [string isEqualToString:filtered];
        }
        
        
        
       //  Limits the no of characters to be enter in text field
        
        return (newLength > CHARACTER_LIMIT ) ? NO : YES;
    }*/
   
    
    return YES;
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==txt_time)
    {
        istimecap=true;
        [textField resignFirstResponder];
        view_picker.hidden=NO;
    }
    else  if (textField==txt_counter)
    {
        istimecap=false;
        
        [textField resignFirstResponder];
        view_picker.hidden=NO;
    }
    else
    {
        view_picker.hidden=YES;
        view_counter.hidden=YES;
    }
}

-(IBAction)settime:(id)sender
{
    
    view_counter.hidden=YES;
    
    NSString *myString = @"00:30";
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSDate *yourDate = [dateFormatter dateFromString:myString];
    [picker setDatePickerMode:UIDatePickerModeCountDownTimer];
    //dateFormatter.dateFormat = @"HH:mm";
    
    [picker setDate:yourDate];
    
    NSInteger totalSubView = [[picker.subviews[0] subviews] count];
    ((UILabel *)[[picker.subviews[0] subviews] objectAtIndex:(totalSubView-2)]).text = @"hours";
    ((UILabel *)[[picker.subviews[0] subviews] objectAtIndex:(totalSubView-1)]).text = @"min";
    
    [txt_round resignFirstResponder];
    istimecap=true;
    view_picker.hidden=NO;
}
-(IBAction)setcounter:(id)sender
{
    
     [txt_round resignFirstResponder];
    
    view_counter.hidden=NO;
    istimecap=false;
    view_picker.hidden=YES;
    
    
    /*NSDate *date = [NSDate new]; // Split up the date components
    NSDateComponents *time = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:date]; NSInteger seconds = ([time hour] * 60 * 60) + ([time minute] * 60);
    //  UIDatePicker *picker = [UIDatePicker new];
    [picker setDatePickerMode:UIDatePickerModeCountDownTimer];
    [picker setCountDownDuration:seconds];*/
    // [[self view] addSubview:picker];
    // [picker setValue:[UIColor colorWithRed:174/255.0f green:174/255.0f blue:174/255.0f alpha:1.0f] forKeyPath:@"textColor"];
    
   /* NSString *myString = @"00:30:30";
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSDate *yourDate = [dateFormatter dateFromString:myString];
    //dateFormatter.dateFormat = @"HH:mm";
    
    [picker setDate:yourDate];*/
    
  //  [picker addTarget:self action:@selector(dateIsChanged:) forControlEvents:UIControlEventTouchDragExit];

    //[picker addTarget:self action:@selector(updateLabelFromPicker:) forControlEvents:UIControlEventValueChanged];

    
    
    /*NSInteger totalSubView = [[picker.subviews[0] subviews] count];
    ((UILabel *)[[picker.subviews[0] subviews] objectAtIndex:(totalSubView-2)]).text = @"min";
    ((UILabel *)[[picker.subviews[0] subviews] objectAtIndex:(totalSubView-1)]).text = @"sec";*/
    
   /* [picker setDatePickerMode:UIDatePickerModeTime];
    
   // NSString *myString = @"00:30:10";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
 //   [formatter setDateFormat:@"hh:mm:ss a"];
    
    NSLog(@"Current Date: %@", [formatter stringFromDate:[NSDate date]]);
    
    NSString *myString =[formatter stringFromDate:[NSDate date]];
    
    NSDate *yourDateh = [formatter dateFromString:myString];
    
    [picker setDate:yourDateh];*/
    
    
    
      
  
}

- (IBAction)updateLabelFromPicker:(id)sender
{
    NSInteger totalSubView = [[picker.subviews[0] subviews] count];
    ((UILabel *)[[picker.subviews[0] subviews] objectAtIndex:(totalSubView-2)]).text = @"min";
    ((UILabel *)[[picker.subviews[0] subviews] objectAtIndex:(totalSubView-1)]).text = @"sec";
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
- (void) pickerValueDidChangeWithHourIndex:(NSInteger)hour_index andMinIndex:(NSInteger)minIndex
{
 
    
    str_counter=[NSString stringWithFormat:@"%02ld:%02ld",(long)hour_index,(long)minIndex];
}


-(IBAction)Home:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)Log:(id)sender
{
    UIStoryboard *death =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Workoutlog_ViewController *forgot = [death instantiateViewControllerWithIdentifier:@"Workoutlog_ViewController"];
    [self.navigationController pushViewController:forgot animated:NO];
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
