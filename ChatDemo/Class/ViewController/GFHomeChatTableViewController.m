//
//  GFHomeChatTableViewController.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHomeChatTableViewController.h"
#import "GFChatTitleView.h"

@interface GFHomeChatTableViewController()

@property (nonatomic,strong) GFChatTitleView *navigationTitleView;

@end


@implementation GFHomeChatTableViewController

#pragma mark - lazy load 


#pragma mark - configView
- (void)configView {
    
    
}

- (void)configNavigation {
    _navigationTitleView = [[GFChatTitleView alloc] initWithFrame:CGRectMake(50, 5, SCREEN_WIDTH - 100, 40)];
    self.navigationItem.titleView = self.navigationTitleView;
    _navigationTitleView.mainTitle = @"我是一个小黄瓜";
    _navigationTitleView.subTitle = @"4G在线";
    
    _navigationTitleView.touchCurrentView = ^{
        NSLog(@"___________%s",__func__);
    };
}

#pragma mark - system load function

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configView];
    [self configNavigation];
    self.backgroundImage = [UIImage imageNamed:@"chat_bg_01"];
}


@end
