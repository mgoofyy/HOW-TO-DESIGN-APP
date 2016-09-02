//
//  GFBaseView.m
//  ChatDemo
//
//  Created by goofygao on 9/2/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFBaseView.h"

@interface GFBaseView()<UIGestureRecognizerDelegate>

@end

@implementation GFBaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)configGestureRecognize {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(signalGestureAction)];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - action 

- (void)signalGestureAction {
    !_touchCurrentView ? : _touchCurrentView();
}

@end
