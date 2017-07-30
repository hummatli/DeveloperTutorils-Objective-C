//
//  HTTPService.m
//  DeveloperTutorials
//
//  Created by Settar Hummetli on 7/30/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORILAS "/tutorials"

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

- (void)getTutorials:(nullable onComplete)completionHandler {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORILAS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                NSLog(@"JSON: %@", json.debugDescription);
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupt, PLease try again");
            }
            
        } else {
            NSLog(@"Err: %@", error.debugDescription);
            completionHandler(nil, @"Proble connecting to the server");
        }
        
    }]resume];
}

@end
