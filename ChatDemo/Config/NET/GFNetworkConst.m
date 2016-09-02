//
//  GFNetworkConst.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFNetworkConst.h"

#ifdef COFFEE_DEBUG
//测试服务器
NSString *const GFAPIRootBsseURL         = @"http://www.goofyy.com/api-test/v1.1/";

#else
//生产服务器
NSString *const GFAPIRootBsseURL         = @"http://www.goofyy.com/api/v1.1/";

#endif




@implementation GFNetworkConst

@end
