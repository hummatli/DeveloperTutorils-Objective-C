//
//  ViewController.m
//  DeveloperTutorials
//
//  Created by Settar Hummetli on 7/30/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

#import "ViewController.h"
#include "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[HTTPService instance]test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
