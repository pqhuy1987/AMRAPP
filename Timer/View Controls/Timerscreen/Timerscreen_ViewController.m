//
//  Timerscreen_ViewController.m
//  Timer
//
//  Created by Sprobit on 15/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import "Home_ViewController.h"


@interface Timerscreen_ViewController ()

@end

@implementation Timerscreen_ViewController

@synthesize time;
@synthesize second;
@synthesize round;
@synthesize countdown;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].idleTimerDisabled = YES;

    
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    is_settimecap=false;
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
   timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
   /* remainingCounts = [time integerValue];
    remainingCounts=remainingCounts*60;
    remainingsecond=[second integerValue];*/
    
      NSArray *yourWords = [countdown componentsSeparatedByString:@":"];
    
       NSInteger mm= [[yourWords firstObject] integerValue];
    NSInteger ss= [[yourWords lastObject] integerValue];
    
      remainingCounts=mm *60;
    
     remainingCounts = (remainingCounts)+ ss;
    
    lbl_timer.textColor=[UIColor yellowColor];
    
    noround =[round integerValue];
    
    
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 2.0;
    [self.view addGestureRecognizer:longPress];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tapGesture];
    
    timer_counttep = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timelesthen5) userInfo:nil repeats:YES];
    
    is_round=true;
    stopBlinking=false;
    
    
   /* [UIView transitionWithView:self.view duration:10.10 options:UIViewAnimationOptionTransitionNone animations:^{
        [self.view setBackgroundColor:[UIColor colorWithRed:10 green:10 blue:10 alpha:1]];
    }completion:^(BOOL finished) {
        
    }];*/
    
  
    
    
    //[lbl_timer sizeToFit];
    //lbl_timer.text=[NSString stringWithFormat : @ "%@",timer];
}
-(void)blink
{
    blinkingtime++;
    
    if(blinkStatus == NO)
    {
        self.view.backgroundColor = [UIColor whiteColor];
      //  self.view.backgroundColor = [UIColor colorWithRed:(22/255.f) green:(22/255.f) blue:(22/255.f) alpha:1.0f];
        blinkStatus = YES;
    }
    else
    {
        self.view.backgroundColor =[UIColor blackColor];
        blinkStatus = NO;
    }
    
    
    if (blinkingtime==15)
    {
        blinkingtime=0;
        self.view.backgroundColor = [UIColor colorWithRed:(22/255.f) green:(22/255.f) blue:(22/255.f) alpha:1.0f];
        [blankingtimer invalidate];
    }
    
}

-(void)timelesthen5
{
    if(--lestime==0)
    {
        [timer_counttep invalidate];
        is_round=true;
    }
    
}
-(void)handleTapGesture:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateRecognized)
    {
        if (is_settimecap)
        {
            if (is_round)
            {
                
                if (!stopBlinking)
                {
                    [timer_counttep invalidate];
                    
                    contround=contround+1;
                    is_round=false;
                    lestime=5;
                    
                    timer_counttep = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timelesthen5) userInfo:nil repeats:YES];
                    
                    
                    blankingtimer = [NSTimer
                                     scheduledTimerWithTimeInterval:(NSTimeInterval)(0.10)
                                     target:self
                                     selector:@selector(blink)
                                     userInfo:nil
                                     repeats:YES];
                    blinkStatus = NO;
                }
               
                
            }
        }
        
       // lestime=lestime+1;
    }
}


-(void)handleLongPress:(UILongPressGestureRecognizer*)recognizer
{
    NSLog(@"double oo");
    
    [timer_counttep invalidate];
    
    stopBlinking=true;
    
    lbl_push.hidden=NO;
    
    [timer invalidate];
    view_button.hidden=NO;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
   // [ApplicationDelegate restrictRotation:YES];
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
            return [NSString stringWithFormat:@"%02d:%02d",  minutes, seconds];
        }
        //we have only seconds example : 25s

        return [NSString stringWithFormat:@"%02d:%02d", minutes,seconds];
}

 -(void)countDown
{
    if(--remainingCounts ==0)
    {
      //  if (--noround==0)
       // {
            if (!is_settimecap)
            {
                
                lbl_timer.textColor=[UIColor redColor];
                
                
                remainingCounts=[time integerValue] * (60 * 60);
                
                if (remainingCounts==0)
                {
                    remainingCounts = [second integerValue] * 60;
                }
                else
                {
                    lbl_timer.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:120];
                    
                    remainingCounts = (remainingCounts)+ ([second integerValue] * 60);
                }
                
                remainingCounts =remainingCounts+remainingsecond;
                
                is_settimecap=true;
                
              /*  is_settimecap=true;
                
                lbl_timer.textColor=[UIColor redColor];
                
               noround =[round integerValue];
                
                remainingCounts=[time integerValue] * (60 * 60);
                
                if (remainingCounts==0)
                {
                    remainingCounts = [second integerValue] * 60;
                }
                else
                {
                    remainingCounts = (remainingCounts)+ ([second integerValue] * 60);
                }
                remainingCounts =remainingCounts+remainingsecond;
            }
            else
            {
                [timer invalidate];
                view_result.hidden=NO;
                
                lbl_complet.hidden=NO;
                
               
            }*/
           
        }
        else
        {
            [timer invalidate];
            
            stopBlinking=true;
            view_result.hidden=NO;
            
            lbl_complet.hidden=NO;
            
        }
    }
    
    NSString *send=[NSString stringWithFormat:@"%ld",(long)remainingCounts];
    
    int set=[send intValue];
    NSString *str=[self formatTimeFromSeconds:set];
   // lbl_timer.font = [UIFont systemFontOfSize:162.0];
    
    lbl_timer.text=[NSString stringWithFormat: @"%@",str];
    
}


-(IBAction)ResumeTimer:(id)sender
{
    stopBlinking=false;
    
    timer_counttep = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timelesthen5) userInfo:nil repeats:YES];
    
     lbl_push.hidden=YES;
    view_button.hidden=YES;
     timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
}
-(IBAction)StopTimer:(id)sender
{
    [timer invalidate];
    [timer_counttep invalidate];
    
    
    
    

    
    if (!contround==0)
    {
        
         NSInteger intround=[round integerValue]*contround;
        
        round=[NSString stringWithFormat:@"%ld",(long)intround];
        
        
        NSInteger  gettime=[time integerValue] * (60 * 60);
        
        
        if (gettime==0)
        {
            
            gettime = [second integerValue] * 60;
        }
        else
        {
            gettime = (gettime)+ ([second integerValue] * 60);
        }
        gettime =gettime+remainingsecond;
        
         gettime=gettime*contround;
        
        
        NSString *send=[NSString stringWithFormat:@"%ld",(long)gettime];
        
        int set=[send intValue];
        NSString *str=[self formatTimeFromSeconds:set];
        
        [ApplicationDelegate.dic_result setObject:str forKey:@"time"];
        
        
    }
    
   
    
    
    
 
    
    
    //
    
    [ApplicationDelegate.dic_result setObject:round forKey:@"reps"];
    
    
    
    [ApplicationDelegate.dic_result setObject:[NSString stringWithFormat:@"%ld",(long)contround] forKey:@"rounds"];
    
    [ApplicationDelegate restrictRotation:NO];
    
    UIStoryboard *work =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    workoutresult_ViewController *timescreen = [work instantiateViewControllerWithIdentifier:@"workoutresult_ViewController"];
    [self.navigationController pushViewController:timescreen animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
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
