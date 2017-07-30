//
//  ViewController.m
//  DeveloperTutorials
//
//  Created by Settar Hummetli on 7/30/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

#import "ViewController.h"
#include "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.videoList = [[NSArray alloc]init];
    
    
    [[HTTPService instance]getTutorials:^(NSArray * _Nullable dataArr, NSString * _Nullable errMessage) {
        
        if (dataArr) {
            NSLog(@"Dictionary: %@", dataArr.debugDescription);
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (NSDictionary *d in dataArr) {
                
                Video *v = [[Video alloc]init];
                v.videoTitle = [d objectForKey:@"title"];
                v.videoDescription = [d objectForKey:@"description"];
                v.videoIframe = [d objectForKey:@"thumbnail"];
                v.thumbnailUrl = [d objectForKey:@"iframe"];
                
                [arr addObject:v];
            }
            
            self.videoList = arr;
            [self updateTableData];
            
        } else if (errMessage) {
            //Display alert to the user
        }
    }];
}


- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"main"];
    
    if (!cell) {
        cell = [[VideoCell alloc]init];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

@end
