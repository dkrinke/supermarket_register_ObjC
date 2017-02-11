//
//  HelperFunctions.h
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperFunctions : NSObject

- (BOOL)validateInput:(NSString *)input;
- (NSString *)toCap:(NSString *)lowercase;
- (NSString *) toDollarFormat:(double)amount;

@end
