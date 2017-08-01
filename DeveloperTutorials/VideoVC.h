//
//  VideoVC.h
//  DeveloperTutorials
//
//  Created by Settar Hummetli on 8/1/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>
@property (nonatomic,strong) Video *video;
@end
