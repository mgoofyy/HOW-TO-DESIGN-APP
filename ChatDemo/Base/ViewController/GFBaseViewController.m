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
    self.view = self.backgroundImageView;
    self.backgroundImageView.frame = self.view.bounds;
}

#pragma mark - set

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    _backgroundImageView.image = backgroundImage;
    _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_backgroundImageView sizeToFit];
    
}

#pragma mark - system load function

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBackgroundView];
    // Do any additional setup after loading the view.
}

@end
