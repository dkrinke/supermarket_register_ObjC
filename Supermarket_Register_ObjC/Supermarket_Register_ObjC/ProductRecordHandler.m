//
//  ProductRecordHandler.m
//  Supermarket_Register_ObjC
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductRecord.h"

@interface ProductRecordHandler : NSObject {

    NSMutableDictionary *productDictionary;
}
@end

@implementation ProductRecordHandler

- (id)init {
    if ( self = [super init] ) {
        productDictionary = [[NSMutableDictionary alloc] init];
        
        ProductRecord *product1 = [[ProductRecord alloc] init];
        double product1price = 3.46;
        [product1 passInName:@"Cereal" passInCode:@"A12T-4GH7-QPL9-3N4M" passInPrice: &product1price];
        ProductRecord *product2 = [[ProductRecord alloc] init];
        double product2price = 8.18;
        [product2 passInName:@"Chicken" passInCode:@"E5T6-9UI3-TH15-QR88" passInPrice: &product2price];
        ProductRecord *product3 = [[ProductRecord alloc] init];
        double product3price = 1.63;
        [product3 passInName:@"Pop" passInCode:@"YRT6-72AS-K736-L4AR" passInPrice: &product3price];
        ProductRecord *product4 = [[ProductRecord alloc] init];
        double product4price = 6.78;
        [product4 passInName:@"Pizza" passInCode:@"TQ4C-VV6T-75ZX-1RMR" passInPrice: &product4price];
        ProductRecord *product5 = [[ProductRecord alloc] init];
        double product5price = 5.89;
        [product5 passInName:@"Tuna" passInCode:@"65P1-UDGM-XH2M-LQW2" passInPrice: &product5price];
        
        [self addKey: @"A12T-4GH7-QPL9-3N4M" addProduct: product1];
        [self addKey: @"E5T6-9UI3-TH15-QR88" addProduct: product2];
        [self addKey: @"YRT6-72AS-K736-L4AR" addProduct: product3];
        [self addKey: @"TQ4C-VV6T-75ZX-1RMR" addProduct: product4];
        [self addKey: @"65P1-UDGM-XH2M-LQW2" addProduct: product5];
        
//        [self printAllRecords]; //For testing
    }
    return self;
}


/**
 Adds a Product record to the productRecordList

 - parameter bar: Product key, Product Record.

 - returns: Void.
*/
- (BOOL) addKey: (NSString *) key addProduct: (ProductRecord *) product{
    BOOL success = YES;
    
    [productDictionary setObject: product forKey: key];
    NSLog(@"[Product Added]");
    [self printRecord: key];

    return success;
}

- (void) printRecord: (NSString *) key{
    ProductRecord<NSObject> *value = productDictionary[key];
    
    NSLog(@"Product Name: %@", [value getName]);
    NSLog(@"Product Code: %@", [value getCode]);
    NSLog(@"Product Price: $%.2f", [value getPrice]);
    NSLog(@"*************************************");
}

/**
 Prints out a single product to the console for testing.
 based on product key input.
 
 - parameter bar: Product code.
 
 - returns: Void.
*/
- (void) printAllRecords{
    for (id object in productDictionary.allKeys) {
        [self printRecord: object];
    }
}

/**
 Calculates the total(Including tax) based on the user input.

 - parameter bar: A string containing product codes seperated with a ;.
 
 - returns: Returns the tax and the total value(Including tax).
*/
- (NSMutableArray *) calcTotal: (NSString *) productCodes{
    NSArray *array = [productCodes componentsSeparatedByString:@";"];
    
    NSLog(@"Array after split: %@", array);

    NSMutableArray *result = [[NSMutableArray alloc] init];
    double total = 0.00;
    
    for (id object in array){
        if(![object isEqual:@""])
        {
        ProductRecord<NSObject> *value = productDictionary[object];
        NSLog(@"Product Price: $%.2f", [value getPrice]);
        total = total + [value getPrice];
        }
    }
    NSLog(@"Total Price: $%.2f", total);

    [result addObject: [NSNumber numberWithDouble: total]];
    
    return result;
}

@end

//    /**
//     Calculates the total(Including tax) based on the user input.
//     
//     - parameter bar: A string containing product codes seperated with a ;.
//     
//     - returns: Returns the tax and the total value(Including tax).
//     */
//    func calcTotal(products: String) -> Array<Double> {
//        let list = products.components(separatedBy: ";")
//        var result = Array<Double>()
//        
//        var total = 0.00
//        
//        list.forEach { (code) in
//            
//            if let product = productRecordList[code]
//            {
//                total += product.getPrice
//            }
//        }
//        
//        let tax = calculateTax(preTaxTotal: total)
//        total += tax
//        
//        result.append(tax)
//        result.append(total)
//        
//        return result
//    }
//    
//    /**
//     Calculates the tax based on the total input.
//     
//     - parameter bar: The pre-tax total.
//     
//     - returns: Tax value rounded to two decimal places.
//     */
//    func calculateTax(preTaxTotal: Double) -> Double {
//        
//        let tax = preTaxTotal * 0.0875
//        let roundedTax = Double(round(100*tax)/100)
//        
//        return roundedTax
//    }
