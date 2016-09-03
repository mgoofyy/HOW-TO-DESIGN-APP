//
//  GFHomeChatTableViewController.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHomeChatTableViewController.h"
#import "GFChatTitleView.h"
#import "GFChatInputView.h"

@interface GFHomeChatTableViewController()

@property (nonatomic,strong) GFChatTitleView *navigationTitleView;
@property (nonatomic,strong) GFChatInputView *chatInputView;

@end


@implementation GFHomeChatTableViewController

#pragma mark - lazy load


#pragma mark - configView
- (void)configView {
    self.backgroundImage = [UIImage imageNamed:@"chat_bg_01"];
    
}

- (void)configNavigation {
    _navigationTitleView = [[GFChatTitleView alloc] initWithFrame:CGRectMake(50, 5, SCREEN_WIDTH - 100, 40)];
    self.navigationItem.titleView = self.navigationTitleView;
    _navigationTitleView.mainTitle = @"我是一个小黄瓜";
    _navigationTitleView.subTitle = @"WIFI在线";
    
    _navigationTitleView.touchCurrentView = ^{
        NSLog(@"___________%s",__func__);
    };
}

- (void)configChatInputView {
    _chatInputView = [[GFChatInputView alloc] init];
    [self.view addSubview:self.chatInputView];
    
    _chatInputView.backgroundColor = [UIColor redColor];
    [_chatInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
}

#pragma mark - system load function

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configView];
    [self configNavigation];
    
    
    [self configChatInputView];
}


@end
