//
//  GFNavigationController.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFNavigationController.h"

@interface GFNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic,strong) id popGestureRecognizerDelegate;

@end

@implementation GFNavigationController

+ (void)initialize
{
    if (self == [super class]) {
        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
        item.tintColor = [UIColor whiteColor];
        
        
    }
}

#pragma mark - init

- (void)configView {
    self.navigationBar.barTintColor = GFMainThemeColor;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, 20)];
    statusBarView.backgroundColor = GFMainThemeColor;
    [self.navigationBar addSubview:statusBarView];
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.translucent = YES;
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundColor:GFMainThemeColor];
    [self.navigationBar setBackgroundImage:[UIImage imageFromColor:GFMainThemeColor] forBarMetrics:UIBarMetricsDefault];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    self.delegate = self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigation_item_back"] highImage:[UIImage imageNamed:@"navigation_item_back"] target:self action:@selector(backToLastPage) forControlEvents:UIControlEventTouchDown];
    }
    [super pushViewController:viewController animated:animated];
    
    
}

#pragma mark - delegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate =_popGestureRecognizerDelegate;
    } else {
        _popGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
        self.interactivePopGestureRecognizer.delegate = nil;
        
    }
}


#pragma mark - action

- (void)backToLastPage {
    [self popViewControllerAnimated:YES];
}

@end
