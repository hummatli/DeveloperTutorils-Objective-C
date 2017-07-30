//
//  HTTPService.h
//  DeveloperTutorials
//
//  Created by Settar Hummetli on 7/30/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArr, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (id)instance;
- (void)test;
- (void)getTutorials:(nullable onComplete)completionHandler;

@end
