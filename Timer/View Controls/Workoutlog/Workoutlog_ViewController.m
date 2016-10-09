//
//  Workoutlog_ViewController.m
//  Timer
//
//  Created by Sprobit on 15/08/16.
//  Copyright © 2016 Sprobit. All rights reserved.
//

#import "Home_ViewController.h"
@import GoogleMobileAds;
@import FirebaseAnalytics;
@import Firebase;


@interface Workoutlog_ViewController ()
@property (weak, nonatomic) IBOutlet GADBannerView *BannerAd2;

@end

@implementation Workoutlog_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"WORKOUT LOG";
    
    NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    self.navigationItem.hidesBackButton = YES;
    
    self.BannerAd2.adUnitID = @"ca-app-pub-5722562744549789/4964470557";
    self.BannerAd2.rootViewController = self;
    [self.BannerAd2 loadRequest:[GADRequest request]];
    
     [[self navigationController] setNavigationBarHidden:NO animated:NO];
    
    
   
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    array_log=[[NSMutableArray alloc] init];
    
    tbl_log.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    NSString *getData = [NSString stringWithFormat: @"SELECT * FROM Workout"];
    
    array_log = [DBConnection fetchResults:getData];
    
    [tbl_log reloadData];
    
  
    [ApplicationDelegate restrictRotation:NO];
}
//table divided in section fun.
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//table contain number of row fun.
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array_log.count;
}

//Display a table contain record fun.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // NSDictionary *viewpost=[array_post_image objectAtIndex:indexPath.row];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_worckout" forIndexPath:indexPath];
    
    UILabel *lbl_class_title  = (UILabel *)[cell viewWithTag:100];
    lbl_class_title.text= [[array_log objectAtIndex:indexPath.row] valueForKey:@"Date"];
    lbl_class_title.numberOfLines=0;
    
    UILabel * lbl_class_name=(UILabel *)[cell viewWithTag:101];
     lbl_class_name.text=[[array_log objectAtIndex:indexPath.row] valueForKey:@"name"];
     lbl_class_name.numberOfLines=0;
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    
    return cell;
    
}
//when table row select , maintain event
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIStoryboard *work =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    workoutresult_ViewController *timescreen = [work instantiateViewControllerWithIdentifier:@"workoutresult_ViewController"];
    timescreen.dic_select=[array_log objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:timescreen animated:YES];
    // tab menu call
    
}
-(IBAction)Home:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
