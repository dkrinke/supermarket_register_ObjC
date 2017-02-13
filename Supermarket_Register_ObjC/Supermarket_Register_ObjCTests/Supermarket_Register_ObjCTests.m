//
//  Supermarket_Register_ObjCTests.m
//  Supermarket_Register_ObjCTests
//
//  Created by iostest on 2/11/17.
//  Copyright © 2017 Gannett. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ProductRecord.h"
#import "ProductRecordHandler.h"

@interface Supermarket_Register_ObjCTests : XCTestCase

@end

@implementation Supermarket_Register_ObjCTests

    NSArray *keys;
    double total[] = {28.21,21.80,14.43,20.03,19.06,14.43,12.91,11.94,20.03,12.91,17.54,19.06,11.94,17.54,14.43,20.03,19.06,14.43,18.04,17.07,
        20.03,18.04,22.67,19.06,17.07,22.67,14.43,12.91,11.94,14.43,18.04,17.07,12.91,18.04,15.55,11.94,17.07,15.55,20.03,12.91,17.54,20.03,18.04,22.67,
        12.91,18.04,15.55,17.54,22.67,15.55,19.06,11.94,17.54,19.06,17.07,22.67,11.94,17.07,15.55,17.54,22.67,15.55,12.66,5.54,11.14,10.17,12.66,10.67,
        16.27,15.3,5.54,10.67,9.15,8.18,11.14,16.27,9.15,13.78,10.17,15.3,8.18,13.78,3.76,8.90,1.77,7.37,6.41,0.52};

- (void)setUp {
    [super setUp];
    keys = [NSArray arrayWithObjects:
                     @"A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2",
                     @"A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR",
                     @"A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR",
                     @"A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88;TQ4C-VV6T-75ZX-1RMR",
                     @"A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88;65P1-UDGM-XH2M-LQW2",
                     @"A12T-4GH7-QPL9-3N4M;YRT6-72AS-K736-L4AR;E5T6-9UI3-TH15-QR88",
                     @"A12T-4GH7-QPL9-3N4M;YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR",
                     @"A12T-4GH7-QPL9-3N4M;YRT6-72AS-K736-L4AR;65P1-UDGM-XH2M-LQW2",
                     @"A12T-4GH7-QPL9-3N4M;TQ4C-VV6T-75ZX-1RMR;E5T6-9UI3-TH15-QR88",
                     @"A12T-4GH7-QPL9-3N4M;TQ4C-VV6T-75ZX-1RMR;YRT6-72AS-K736-L4AR",
                     @"A12T-4GH7-QPL9-3N4M;TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2",
                     @"A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2;E5T6-9UI3-TH15-QR88",
                     @"A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2;YRT6-72AS-K736-L4AR",
                     @"A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2;TQ4C-VV6T-75ZX-1RMR",
                     @"E5T6-9UI3-TH15-QR88;A12T-4GH7-QPL9-3N4M;YRT6-72AS-K736-L4AR",
                     @"E5T6-9UI3-TH15-QR88;A12T-4GH7-QPL9-3N4M;TQ4C-VV6T-75ZX-1RMR",
                     @"E5T6-9UI3-TH15-QR88;A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2",
                     @"E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR;A12T-4GH7-QPL9-3N4M",
                     @"E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR",
                     @"E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR;65P1-UDGM-XH2M-LQW2",
                     @"E5T6-9UI3-TH15-QR88;TQ4C-VV6T-75ZX-1RMR;A12T-4GH7-QPL9-3N4M",
                     @"E5T6-9UI3-TH15-QR88;TQ4C-VV6T-75ZX-1RMR;YRT6-72AS-K736-L4AR",
                     @"E5T6-9UI3-TH15-QR88;TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2",
                     @"E5T6-9UI3-TH15-QR88;65P1-UDGM-XH2M-LQW2;A12T-4GH7-QPL9-3N4M",
                     @"E5T6-9UI3-TH15-QR88;65P1-UDGM-XH2M-LQW2;YRT6-72AS-K736-L4AR",
                     @"E5T6-9UI3-TH15-QR88;65P1-UDGM-XH2M-LQW2;TQ4C-VV6T-75ZX-1RMR",
                     @"YRT6-72AS-K736-L4AR;A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88",
                     @"YRT6-72AS-K736-L4AR;A12T-4GH7-QPL9-3N4M;TQ4C-VV6T-75ZX-1RMR",
                     @"YRT6-72AS-K736-L4AR;A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2",
                     @"YRT6-72AS-K736-L4AR;E5T6-9UI3-TH15-QR88;A12T-4GH7-QPL9-3N4M",
                     @"YRT6-72AS-K736-L4AR;E5T6-9UI3-TH15-QR88;TQ4C-VV6T-75ZX-1RMR",
                     @"YRT6-72AS-K736-L4AR;E5T6-9UI3-TH15-QR88;65P1-UDGM-XH2M-LQW2",
                     @"YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR;A12T-4GH7-QPL9-3N4M",
                     @"YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR;E5T6-9UI3-TH15-QR88",
                     @"YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2",
                     @"YRT6-72AS-K736-L4AR;65P1-UDGM-XH2M-LQW2;A12T-4GH7-QPL9-3N4M",
                     @"YRT6-72AS-K736-L4AR;65P1-UDGM-XH2M-LQW2;E5T6-9UI3-TH15-QR88",
                     @"YRT6-72AS-K736-L4AR;65P1-UDGM-XH2M-LQW2;TQ4C-VV6T-75ZX-1RMR",
                     @"TQ4C-VV6T-75ZX-1RMR;A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88",
                     @"TQ4C-VV6T-75ZX-1RMR;A12T-4GH7-QPL9-3N4M;YRT6-72AS-K736-L4AR",
                     @"TQ4C-VV6T-75ZX-1RMR;A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2",
                     @"TQ4C-VV6T-75ZX-1RMR;E5T6-9UI3-TH15-QR88;A12T-4GH7-QPL9-3N4M",
                     @"TQ4C-VV6T-75ZX-1RMR;E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR",
                     @"TQ4C-VV6T-75ZX-1RMR;E5T6-9UI3-TH15-QR88;65P1-UDGM-XH2M-LQW2",
                     @"TQ4C-VV6T-75ZX-1RMR;YRT6-72AS-K736-L4AR;A12T-4GH7-QPL9-3N4M",
                     @"TQ4C-VV6T-75ZX-1RMR;YRT6-72AS-K736-L4AR;E5T6-9UI3-TH15-QR88",
                     @"TQ4C-VV6T-75ZX-1RMR;YRT6-72AS-K736-L4AR;65P1-UDGM-XH2M-LQW2",
                     @"TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2;A12T-4GH7-QPL9-3N4M",
                     @"TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2;E5T6-9UI3-TH15-QR88",
                     @"TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2;YRT6-72AS-K736-L4AR",
                     @"65P1-UDGM-XH2M-LQW2;A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88",
                     @"65P1-UDGM-XH2M-LQW2;A12T-4GH7-QPL9-3N4M;YRT6-72AS-K736-L4AR",
                     @"65P1-UDGM-XH2M-LQW2;A12T-4GH7-QPL9-3N4M;TQ4C-VV6T-75ZX-1RMR",
                     @"65P1-UDGM-XH2M-LQW2;E5T6-9UI3-TH15-QR88;A12T-4GH7-QPL9-3N4M",
                     @"65P1-UDGM-XH2M-LQW2;E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR",
                     @"65P1-UDGM-XH2M-LQW2;E5T6-9UI3-TH15-QR88;TQ4C-VV6T-75ZX-1RMR",
                     @"65P1-UDGM-XH2M-LQW2;YRT6-72AS-K736-L4AR;A12T-4GH7-QPL9-3N4M",
                     @"65P1-UDGM-XH2M-LQW2;YRT6-72AS-K736-L4AR;E5T6-9UI3-TH15-QR88",
                     @"65P1-UDGM-XH2M-LQW2;YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR",
                     @"65P1-UDGM-XH2M-LQW2;TQ4C-VV6T-75ZX-1RMR;A12T-4GH7-QPL9-3N4M",
                     @"65P1-UDGM-XH2M-LQW2;TQ4C-VV6T-75ZX-1RMR;E5T6-9UI3-TH15-QR88",
                     @"65P1-UDGM-XH2M-LQW2;TQ4C-VV6T-75ZX-1RMR;YRT6-72AS-K736-L4AR",
                     @"A12T-4GH7-QPL9-3N4M;E5T6-9UI3-TH15-QR88",
                     @"A12T-4GH7-QPL9-3N4M;YRT6-72AS-K736-L4AR",
                     @"A12T-4GH7-QPL9-3N4M;TQ4C-VV6T-75ZX-1RMR",
                     @"A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2",
                     @"E5T6-9UI3-TH15-QR88;A12T-4GH7-QPL9-3N4M",
                     @"E5T6-9UI3-TH15-QR88;YRT6-72AS-K736-L4AR",
                     @"E5T6-9UI3-TH15-QR88;TQ4C-VV6T-75ZX-1RMR",
                     @"E5T6-9UI3-TH15-QR88;65P1-UDGM-XH2M-LQW2",
                     @"YRT6-72AS-K736-L4AR;A12T-4GH7-QPL9-3N4M",
                     @"YRT6-72AS-K736-L4AR;E5T6-9UI3-TH15-QR88",
                     @"YRT6-72AS-K736-L4AR;TQ4C-VV6T-75ZX-1RMR",
                     @"YRT6-72AS-K736-L4AR;65P1-UDGM-XH2M-LQW2",
                     @"TQ4C-VV6T-75ZX-1RMR;A12T-4GH7-QPL9-3N4M",
                     @"TQ4C-VV6T-75ZX-1RMR;E5T6-9UI3-TH15-QR88",
                     @"TQ4C-VV6T-75ZX-1RMR;YRT6-72AS-K736-L4AR",
                     @"TQ4C-VV6T-75ZX-1RMR;65P1-UDGM-XH2M-LQW2",
                     @"65P1-UDGM-XH2M-LQW2;A12T-4GH7-QPL9-3N4M",
                     @"65P1-UDGM-XH2M-LQW2;E5T6-9UI3-TH15-QR88",
                     @"65P1-UDGM-XH2M-LQW2;YRT6-72AS-K736-L4AR",
                     @"65P1-UDGM-XH2M-LQW2;TQ4C-VV6T-75ZX-1RMR",
                     @"A12T-4GH7-QPL9-3N4M",
                     @"E5T6-9UI3-TH15-QR88",
                     @"YRT6-72AS-K736-L4AR",
                     @"TQ4C-VV6T-75ZX-1RMR",
                     @"65P1-UDGM-XH2M-LQW2", nil];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testInitProductRecordHandler{
    ProductRecordHandler *productRecordHandler;
    productRecordHandler = [[ProductRecordHandler alloc] init];
    XCTAssertNotNil(productRecordHandler, "Pass");
}

- (void)testInitProductRecords{
    ProductRecordHandler *productRecordHandler;
    productRecordHandler = [[ProductRecordHandler alloc] init];
    XCTAssertTrue([productRecordHandler init],"initProductRecords() Failed");
}

- (void)testCreateProductRecord {
    ProductRecord *product = [[ProductRecord alloc] init];
    
    NSString *name = @"Cereal";
    NSString *code = @"A12T-4GH7-QPL9-3N4M";
    double productPrice = 3.46;
    
    [product passInName:@"Cereal" passInCode:@"A12T-4GH7-QPL9-3N4M" passInPrice: &productPrice];
    
    XCTAssertEqual([product getName], name, "testCreateProductRecord: name");
    XCTAssertEqual([product getCode], code, "testCreateProductRecord: code");
    XCTAssertEqual([product getPrice], productPrice, "testCreateProductRecord: price");
}

- (void)testCalcTotal{
    
    ProductRecordHandler *productRecordHandler;
    productRecordHandler = [[ProductRecordHandler alloc] init];
    int i = 0;
    
    for(id key in keys)
    {        
        double totalExpected = round(100*total[i])/100;
        NSMutableArray *actualTotal = [productRecordHandler calcTotal: key];
        NSNumber *result = actualTotal[1];
        double totalActual = round(100*result.doubleValue)/100;

        i+=1;
        XCTAssertEqual(totalExpected, totalActual);
    }
}


@end
