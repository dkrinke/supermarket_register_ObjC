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

- (NSString *)toCap:(NSString *)lowercase{
    return lowercase.uppercaseString;
}

//    func toCap(lowercase: String) -> String{
//        return lowercase.uppercased()
//    }

@end


//    /**
//     Vadlidates users input
//     
//     - parameter bar: String of user input
//     
//     - returns: Boolean.
//     */
//    func validateInput(input: String) -> Bool{
//        
//        if(input == ""){
//            return false;
//        }
//        
//        
//        let inputPattern = "/((((((([A-Za-z0-9]){4}(-)){3})([A-Za-z0-9]){4}(;|)))(?!-))+)/g"
//        let matcher = RegexHelper(inputPattern)
//        
//        if matcher.match(input: input) {
//            return true
//        }
//        
//        return false;
//    }
//    
//    struct RegexHelper {
//        let regex: NSRegularExpression?
//        
//        init(_ pattern: String) {
//            var error: NSError?
//            regex = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error)
//        }
//        
//        func match(input: String) -> Bool {
//            if let matches = regex?.matchesInString(input, options: nil, range: NSMakeRange(0, count(input))){
//                return matches.count > 0
//            } else {
//                return false
//            }
//        }
//    }
//    
//    /**
//     Converts user input to uppercase and returns the result
//     
//     - parameter bar: String of user input
//     
//     - returns: String.
//     */
//    func toCap(lowercase: String) -> String{
//        return lowercase.uppercased()
//    }
//    
//    /**
//     Converts a Double into a Dollar amount format String
//     
//     - parameter bar: String Double amount
//     
//     - returns: String.
//     */
//    func returnDollarFormat(amount: Double) -> String {
//        return "$" + String(format:"%.02f", amount)
//    }
