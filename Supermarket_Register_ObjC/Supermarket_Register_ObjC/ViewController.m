//
//  ViewController.m
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (weak, nonatomic) IBOutlet UILabel *tax;
@property (weak, nonatomic) IBOutlet UILabel *total;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor]; //Change background color
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitProcessCodes:(UIButton *)sender {
    NSLog(@"Submit Clicked"); //Testing
    
    NSString *enteredText = [_userInput text];
    
    NSLog(@"User Input: %@", enteredText); //Testing
    
    //Helper Functions called here
    
    //Product Handler Functions called here
    
    _tax.text = @"$0.10"; //Testing to confirm UILabel update method
    _total.text = @"$1.10"; //Testing to confirm UILabel update method
}
@end
