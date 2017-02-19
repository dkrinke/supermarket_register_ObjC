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
    
    NSString *enteredText = [_userInput text];
        
    //Helper Functions called here
    if([helper validateInput: [helper toCap:enteredText]])
    {
//        NSLog(@"Passed"); //Testing
        //Product Handler Functions called here
        NSMutableArray *results = [productRecordHandler calcTotal: enteredText];
        NSNumber *realTax = results[0];
        NSNumber *realTotal = results[1];
        
        if (realTax.doubleValue != 0.00 && realTotal.doubleValue != 0.00)
        {
            _tax.text = [helper toDollarFormat:realTax.doubleValue]; //Testing to confirm UILabel update method
            _total.text = [helper toDollarFormat:realTotal.doubleValue]; //Testing to confirm UILabel update method
        }
        else{
            _tax.text = [helper toDollarFormat:0.00]; //Testing to confirm UILabel update method
            _total.text = [helper toDollarFormat:0.00]; //Testing to confirm UILabel update method
            [self displayErrorMessage:0];

        }

    }
    else
    {
        [self displayErrorMessage:1];
    }
    
}

- (void)displayErrorMessage:(int)messageType{
    
    UIAlertAction * dismiss;
    UIAlertController * alert;
    
    switch (messageType) {
        case 0:
            alert = [UIAlertController
                     alertControllerWithTitle:@"Invalid User Input"
                     message:@"One or more of the product codes entered were incorrect"
                     preferredStyle:UIAlertControllerStyleAlert];
            break;
        case 1:
            alert = [UIAlertController
                     alertControllerWithTitle:@"Invalid User Input"
                     message:@"Try inputing the product codes again. Separate multiple product codes with ;"
                     preferredStyle:UIAlertControllerStyleAlert];
            break;
        default:
            break;
    }
    
    dismiss = [UIAlertAction
               actionWithTitle:@"Dismiss"
               style:UIAlertActionStyleDefault
               handler:^(UIAlertAction * action) {}];
    [alert addAction:dismiss];
    [self presentViewController:alert animated:YES completion:nil];

}

@end
