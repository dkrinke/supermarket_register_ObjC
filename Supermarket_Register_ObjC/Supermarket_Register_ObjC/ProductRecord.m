//
//  ProductRecord.m
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProductRecord : NSObject

@property NSString *name;
@property NSString *code;
@property double price;

@end

@implementation ProductRecord

- (BOOL) passInName:(NSString *) newName passInCode:(NSString *) newCode passInPrice:(double) newPrice {
    BOOL success = YES;
    
    self.name = newName;
    self.code = newCode;
    self.price = newPrice;
    
    return success;
}

/**
 Returns the product name
 
 - returns: NSString.

 */
- (NSString *) getName {
    return self.name;
}

/**
 Returns the product code
 
 - returns: NSString.

 */
- (NSString *) getCode {
    return self.code;
}

/**
 Returns the product price
 
 - returns: double.

 */
- (double) getPrice {
    return self.price;
}

@end
