//
//  GFBaseTableViewController.m
//  ChatDemo
//
//  Created by goofygao on 9/2/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFBaseTableViewController.h"

@interface GFBaseTableViewController ()

@end

@implementation GFBaseTableViewController

#pragma mark - configView

- (void)configCurrentView {
    self.view.backgroundColor = GFViewBGColor;
}

#pragma mark - system load function

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configCurrentView];
    // Do any additional setup after loading the view.
}

@end
