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

@interface GFHomeChatTableViewController()<UITableViewDelegate>

@property (nonatomic,strong) GFChatTitleView *navigationTitleView;
@property (nonatomic,strong) GFChatInputView *chatInputView;
//存放当前页面聊天消息模型
@property (nonatomic,strong) NSMutableArray *models;
@property (nonatomic,strong) UITableView *tableView;

@end


#define Edit_View_Height 46
@implementation GFHomeChatTableViewController

#pragma mark - lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
//        _tableView.separatorColor = nil;
//        _tableView.backgroundColor = nil;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark - configView
- (void)configView {
//    self.backgroundImage = [UIImage imageNamed:@"chat_bg_01"];

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
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.chatInputView];
    
    
    _chatInputView.userInteractionEnabled = YES;
    _chatInputView.backgroundColor = GFMainThemeColor;
    
    _chatInputView.touchCurrentView = ^ {
      NSLog(@"___________%s",__func__);
    };
    
    [_chatInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(Edit_View_Height);
    }];
}

#pragma mark - system load function

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configView];
    [self configNavigation];
    
    [self configChatInputView];
    [self notificationCenter];
}

#pragma mark - function method 

-(void)notificationCenter
{
    //键盘处理
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleWillShowKeyboard:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleWillHideKeyboard:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}


#pragma mark - action

- (void)handleWillShowKeyboard:(NSNotification *)notification {
    
    CGRect keyboardRect;
    keyboardRect = [(notification.userInfo)[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];

    [UIView animateWithDuration:0.25 animations:^{
        [_chatInputView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(Edit_View_Height);
            make.top.mas_equalTo(keyboardRect.origin.y - Edit_View_Height);
        }];
        self.tableView.kc_height = SCREEN_HEIGHT - Edit_View_Height - keyboardRect.size.height;
    } completion:^(BOOL finished) {
        self.models.count == 0 ? :  [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.models.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }];
}

- (void)handleWillHideKeyboard:(NSNotification *)notification {
    CGRect keyboardRect;
    keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.tableView.kc_height = SCREEN_HEIGHT - 49;
        [_chatInputView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(Edit_View_Height);
        }];
    }];
}

@end
