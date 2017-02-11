//
//  ProductRecord.h
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product Record : NSObject

- (BOOL) passInName:(NSString *) newName passInCode:(NSString *) newCode passInPrice:(double *) newPrice;
- (NSString *) getName;
- (NSString *) getCode;
- (double *) getPrice;

@end
