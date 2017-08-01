//
//  VideoCell.h
//  DeveloperTutorials
//
//  Created by Settar Hummetli on 7/30/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
- (void)updateUI:(nonnull Video*)video;
@end
