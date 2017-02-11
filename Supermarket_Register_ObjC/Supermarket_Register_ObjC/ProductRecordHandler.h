//
//  ProductRecordHandler.h
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductRecordHandler : NSObject

- (id)init;
- (NSMutableArray *) calcTotal: (NSString *) productCodes;

@end
