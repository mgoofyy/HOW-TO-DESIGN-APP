//
//  GFChatTitleView.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFChatTitleView.h"

@interface GFChatTitleView()

@property (nonatomic,strong) UILabel *mainLabel;

@property (nonatomic,strong) UILabel *subLabel;

@end

@implementation GFChatTitleView

#pragma mark - lazy load 

- (UILabel *)mainLabel {
    if (!_mainLabel) {
        _mainLabel = [UILabel new];
        _mainLabel.textColor = GFTextWhiteColor;
        _mainLabel.font = [UIFont boldSystemFontOfSize:15];
        _mainLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _mainLabel;
}

- (UILabel *)subLabel {
    if (!_subLabel) {
        _subLabel = [UILabel new];
        _subLabel.textColor = GFTextWhiteColor;
        _subLabel.font = [UIFont systemFontOfSize:10];
        _subLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _subLabel;
}

#pragma mark - initView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainLabel ? : [self configView];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _mainLabel ? : [self configView];
    }
    return self;
}

#pragma mark - configView
- (void)configView {
    
    [self addSubview:self.mainLabel];
    [self addSubview:self.subLabel];
    
    [_mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(5);
    }];
    
    [_subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(12);
        make.top.mas_equalTo(_mainLabel.mas_bottom).offset(5);
    }];
    
}


- (void)setMainTitle:(NSString *)mainTitle {
    _mainLabel.text = mainTitle;
}

- (void)setSubTitle:(NSString *)subTitle {
    _subLabel.text = subTitle;
}
@end










