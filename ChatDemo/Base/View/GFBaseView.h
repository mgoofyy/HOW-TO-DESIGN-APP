//
//  GFBaseView.h
//  ChatDemo
//
//  Created by goofygao on 9/2/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchCurrentView)(void);
@interface GFBaseView : UIView

@property (nonatomic,copy) TouchCurrentView touchCurrentView;

@end
