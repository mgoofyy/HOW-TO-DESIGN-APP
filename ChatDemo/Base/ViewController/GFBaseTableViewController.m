//
//  GFBaseTableViewController.m
//  ChatDemo
//
//  Created by goofygao on 9/2/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFBaseTableViewController.h"

@interface GFBaseTableViewController ()<UITableViewDelegate>

@end

@implementation GFBaseTableViewController

#pragma mark - lazy load 

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.separatorColor = nil;
        _tableView.backgroundColor = nil;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark - configView

- (void)configCurrentView {
    self.view.backgroundColor = GFViewBGColor;
}

- (void)configTableView {
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-44);
    }];
    
    
}

#pragma mark - system load function

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configCurrentView];
    [self configTableView];
    // Do any additional setup after loading the view.
}

@end
