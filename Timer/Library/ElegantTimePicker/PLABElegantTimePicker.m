//
//  PLABElegantTimePicker.m
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import "PLABElegantTimePicker.h"
#import "PLABElegantTimePickerColumnView.h"


@interface PLABElegantTimePicker()
<PLABElegantTimePickerColumnViewDelegate>

@property (nonatomic, strong) PLABElegantTimePickerColumnView* hourColumnView;
@property (nonatomic, strong) PLABElegantTimePickerColumnView* minColumnView;

@end

@implementation PLABElegantTimePicker
- (id)initWithFrame:(CGRect)frame withHourIndex:(NSInteger)hourIndex andMinIndex:(NSInteger)minIndex
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hourColumnView = [[PLABElegantTimePickerColumnView alloc] initWithType:PLAB_ETPSV_TYPE_HOUR andIndex:hourIndex];
        self.minColumnView = [[PLABElegantTimePickerColumnView alloc] initWithType:PLAB_ETPSV_TYPE_MIN andIndex:minIndex];
        self.hourColumnView.delegate = self;
        self.minColumnView.delegate = self;
       /* UIImage* seperatorImage = [UIImage imageNamed:@"background_elegant_picker_seperator"];
        UIImage* topCoverImage = [UIImage imageNamed:@""];
        UIImage* bottomCoverImage = [UIImage imageNamed:@"background_elegant_picker_bottom"];*/
        
        
        UIImage* seperatorImage = [UIImage imageNamed:@"background_elegant_picker_seperator"];
        UIImage* topCoverImage = [UIImage imageNamed:@""];
        UIImage* bottomCoverImage = [UIImage imageNamed:@""];
        
      //  assert(seperatorImage && topCoverImage && bottomCoverImage);
        
        UILabel *lbl_hours=[[UILabel alloc] init];
         UILabel *lbl_min=[[UILabel alloc] init];
        
        UIImageView* seperatorImageView = [[UIImageView alloc] initWithImage:seperatorImage];
        UIImageView* topCoverImageView = [[UIImageView alloc] initWithImage:topCoverImage];
        UIImageView* bottomCoverImageView = [[UIImageView alloc] initWithImage:bottomCoverImage];
       
        [self addSubview:self.hourColumnView];
        [self addSubview:self.minColumnView];
        [self addSubview:topCoverImageView];
        [self addSubview:bottomCoverImageView];
       // [self addSubview:seperatorImageView];
        
        [self addSubview:lbl_hours];
        [self addSubview:lbl_min];
        
        [seperatorImageView sizeToFit];
        [topCoverImageView sizeToFit];
        [bottomCoverImageView sizeToFit];
        
        seperatorImageView.frame = CGRectMake(0, 110, 320, CGRectGetHeight(seperatorImageView.bounds));
        
        
        topCoverImageView.frame = CGRectMake(0, 0, CGRectGetWidth(topCoverImageView.bounds), CGRectGetHeight(topCoverImageView.bounds));
        bottomCoverImageView.frame = CGRectMake(0, PLAB_ETPSV_PICKER_HEIGHT - CGRectGetHeight(topCoverImageView.bounds), CGRectGetWidth(bottomCoverImageView.bounds), CGRectGetHeight(topCoverImageView.bounds));
        
        lbl_hours.frame = CGRectMake(100, 72, 60, 40);
        lbl_hours.text=@"min";
        lbl_hours.font = [UIFont fontWithName:@"AvenirNext-Medium" size:20];
        lbl_hours.textColor = [UIColor whiteColor];
        
        
        lbl_min.frame = CGRectMake(210, 72, 60, 40);
        lbl_min.text=@"sec";
        lbl_min.font = [UIFont fontWithName:@"AvenirNext-Medium" size:20];
        lbl_min.textColor = [UIColor whiteColor];
        
        
    }
    return self;
}

- (NSInteger) hour
{
    return 61;
}

- (NSInteger) minute
{
    return 61;
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    NSInteger upperMargin = (PLAB_ETPSV_PICKER_HEIGHT - PLAB_ETPSV_SINLE_CELL_HEIGHT*3)/2;
    self.hourColumnView.frame = CGRectMake(-20, upperMargin, 180, CGRectGetHeight(self.bounds));
    self.minColumnView.frame = CGRectMake(160, upperMargin, 160, CGRectGetHeight(self.bounds));
}

- (void) didSelectRowWithType:(NSInteger)type andIndex:(NSInteger)index
{
    if (self.delegate)
    {
        [self.delegate pickerValueDidChangeWithHourIndex:self.hourColumnView.index andMinIndex:self.minColumnView.index];
    }
}

@end
