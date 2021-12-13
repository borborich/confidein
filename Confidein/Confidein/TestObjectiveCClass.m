//
//  TestObjectiveCClass.m
//  Confidein
//
//  Created by Shestakov Boris on 13/12/21.
//


#import "TestObjectiveCClass.h"

@implementation TestObjectiveCClass


+(void)printHello{

    // Print log message.
    NSLog(@"Hello from objective-c class.");
}

// This function will return an NSString object with string messages.
-(NSString *)sayHello{
    NSString * var;
    
    var = @"Hello from objective-c class.";
    
    return var;
    
}

@end
