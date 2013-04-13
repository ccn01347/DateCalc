//
//  DatePickerViewController.m
//  DateCalc
//
//  Created by SteveLai on 13年4月13日.
//  Copyright (c) 2013年 SteveLai. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidUnload
{
    [self setDelegate:nil];
}

- (IBAction)setDateTime:(id)sender
{
    [(ViewController *)self.delegate calcultionDateDifference:((UIDatePicker *)sender).date];
}

- (IBAction)dismissDatePicker:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((DatePickerViewController *)segue.destinationViewController).delegate = self;  // 連接dateView係inital scene
}

-(void)viewWillDisappear:(BOOL)animated
{
    ((ViewController *)self.delegate).datePickerVisible = NO;

}

-(void)viewDidAppear:(BOOL)animated
{
    [(ViewController *)self.delegate calcultionDateDifference:[NSDate date]];
}
@end
