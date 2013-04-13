//
//  ViewController.h
//  DateCalc
//
//  Created by SteveLai on 13年4月13日.
//  Copyright (c) 2013年 SteveLai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *outPutLabel;
@property (nonatomic) Boolean datePickerVisible;


- (IBAction)showDatePicker:(id)sender;
-(void)calcultionDateDifference:(NSDate *)chosenDate;
@end
