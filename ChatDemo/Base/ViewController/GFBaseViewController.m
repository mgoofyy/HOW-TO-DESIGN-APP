//
//  GFBaseViewController.m
//  ChatDemo
//
//  Created by goofygao on 9/2/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFBaseViewController.h"

@interface GFBaseViewController ()

@property (nonatomic,strong) UIImageView *backgroundImageView;

@end

@implementation GFBaseViewController

#pragma mark - lazy load

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [UIImageView new];
        _backgroundImageView.contentMode = UIViewContentModeCenter;
    }
    return _backgroundImageView;
}

#pragma mark - configView
- (void)configBackgroundView {
    [self.view addSubview:self.backgroundImageView];
    [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

#pragma mark - set

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    [self configBackgroundView];
    _backgroundImageView.image = backgroundImage;
    _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_backgroundImageView sizeToFit];
    
}

#pragma mark - system load function

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

@end
