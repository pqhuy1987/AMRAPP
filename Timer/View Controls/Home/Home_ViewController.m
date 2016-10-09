//
//  Home_ViewController.m
//  Timer
//
//  Created by Sprobit on 13/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import "Home_ViewController.h"
@import GoogleMobileAds;
@import FirebaseAnalytics;
@import Firebase;

@interface Home_ViewController ()
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end


@implementation Home_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Home";
    
    [ApplicationDelegate restrictRotation:NO];
    
    try_screen =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.bannerView.adUnitID = @"ca-app-pub-5722562744549789/4964470557";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    // Do any additional setup after loading the view.
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
-(IBAction)next
{
    dispatch_async(dispatch_get_main_queue(), ^{
        Amrap_ViewController *forgot = [try_screen instantiateViewControllerWithIdentifier:@"Amrap_ViewController"];
        [self.navigationController pushViewController:forgot animated:YES];
    });
    
   
}

-(IBAction)next1
{
     dispatch_async(dispatch_get_main_queue(), ^{
         
        UIStoryboard *round =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Roundfortime_ViewController *forgot = [round instantiateViewControllerWithIdentifier:@"Roundfortime_ViewController"];
        [self.navigationController pushViewController:forgot animated:YES];
         
     });
}

-(IBAction)next2
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
    UIStoryboard *death =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Deathby_ViewController *forgot = [death instantiateViewControllerWithIdentifier:@"Deathby_ViewController"];
    [self.navigationController pushViewController:forgot animated:YES];
    
    });
}


//try 4 screen design

-(IBAction)round_workout_result:(id)sender
{
    
    //workoutresult_ViewController
   workoutresult_ViewController *forgot = [try_screen instantiateViewControllerWithIdentifier:@"workoutresult_ViewController"];
    
    [self.navigationController pushViewController:forgot animated:YES];
}

-(IBAction)Home:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)Log:(id)sender
{
    
    Workoutlog_ViewController *forgot = [try_screen instantiateViewControllerWithIdentifier:@"Workoutlog_ViewController"];
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
