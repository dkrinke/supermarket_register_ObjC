//
//  ViewController.m
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import "ViewController.h"
#import "HelperFunctions.h"
#import "ProductRecordHandler.h"

@interface ViewController (){

}
@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (weak, nonatomic) IBOutlet UILabel *tax;
@property (weak, nonatomic) IBOutlet UILabel *total;

@end

@implementation ViewController

ProductRecordHandler *productRecordHandler;
HelperFunctions *helper;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor]; //Change background color
    helper = [[HelperFunctions alloc] init];
    productRecordHandler = [[ProductRecordHandler alloc] init];

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
    if([helper validateInput: [helper toCap:enteredText]])
    {
        NSLog(@"Passed"); //Testing
        //Product Handler Functions called here
        NSMutableArray *results = [productRecordHandler calcTotal: enteredText];
        
        double testTax = 0.10000001f;

        NSNumber *realTax = results[0];
        NSNumber *realTotal = results[0];
        
//        NSLog(@"Total: %.2f", realTotal); //Testing
 
        _tax.text = [helper toDollarFormat:testTax]; //Testing to confirm UILabel update method
        _total.text = [helper toDollarFormat:realTotal.doubleValue]; //Testing to confirm UILabel update method

    }
    else
    {
        NSLog(@"Failed"); //Testing
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Invalid User Input"
                                     message:@"Try inputing the product codes again. Separate multiple product codes with ;"
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* dismiss = [UIAlertAction
                                   actionWithTitle:@"Dismiss"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       //Handle no, thanks button
                                   }];
        [alert addAction:dismiss];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
@end
