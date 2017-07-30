//
//  HTTPService.m
//  DeveloperTutorials
//
//  Created by Settar Hummetli on 7/30/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

+ (id)instance {
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[HTTPService alloc]init];
        
    }
    
    return sharedInstance;
}

- (void)test {
    NSLog(@"This is a test");
}

@end
