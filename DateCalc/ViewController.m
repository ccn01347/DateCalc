//
//  ViewController.m
//  DateCalc
//
//  Created by SteveLai on 13年4月13日.
//  Copyright (c) 2013年 SteveLai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize datePickerVisible;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDatePicker:(id)sender
{
    if(self.datePickerVisible != YES){
        [self performSegueWithIdentifier:@"toDatePicker" sender:sender];
        self.datePickerVisible = YES;
    }
}

-(void)calcultionDateDifference:(NSDate *)chosenDate
{
    NSDate *todayDate;
    NSString *differenceOuput;
    NSString *todayDateString;
    NSString *chosenDateString;
    NSDateFormatter *dateFormat;
    NSTimeInterval difference;
    
    todayDate = [NSDate date];
    difference = [todayDate timeIntervalSinceDate:chosenDate] / 86400;  //秒轉日
    
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM d, yyyy hh:mm:ssa"];
    todayDateString = [dateFormat stringFromDate:todayDate];
    chosenDateString = [dateFormat stringFromDate:chosenDate];
    
    differenceOuput = [[NSString alloc] initWithFormat:
                       @"Difference between chosen date (%@) and today(%@) in days: %1.2f", chosenDateString, todayDateString, fabs(difference) ];
    self.outPutLabel.text = differenceOuput;
}
@end
