//
//  HelperFunctions.m
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HelperFunctions : NSObject

@end

@implementation HelperFunctions


/**
 Vadlidates users input
 
 - parameter bar: String of user input
 
 - returns: Boolean.
*/
- (BOOL)validateInput:(NSString *)input{
    
    NSLog(@"toCap Result: %@", input); //Testing
    BOOL didValidate = NO;
    
    if([input  isEqual: @""]){
        didValidate = NO;
    }
    
    else{
        NSError *error = nil;
        NSString *pattern = @"^((([A-Za-z0-9]{4}-){3})[A-Za-z0-9]{4};)$|^((([A-Za-z0-9]{4}-){3})[A-Za-z0-9]{4};)+((([A-Za-z0-9]{4}-){3})[A-Za-z0-9]{4};?)$";
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSAssert(regex, @"Unable to create regular expression");
        
        NSRange textRange = NSMakeRange(0, input.length);
        NSRange matchRange = [regex rangeOfFirstMatchInString:input options:NSMatchingReportProgress range:textRange];
        
        // Did we find a matching range
        if (matchRange.location != NSNotFound)
            didValidate = YES;
    }
    
    return didValidate;
}

/**
 Converts user input to uppercase and returns the result

 - parameter bar: String of user input

 - returns: String.
*/
- (NSString *)toCap:(NSString *)lowercase{
    return lowercase.uppercaseString;
}

/**
 Converts a Double into a Dollar amount format String

 - parameter bar: String Double amount

 - returns: String.
*/
- (NSString *) toDollarFormat:(double *)amount{
    
    NSLog(@"Pre Amount: %.2f", *amount); //Testing
    return [NSString stringWithFormat:@"$%.2f", *amount];
}

@end
