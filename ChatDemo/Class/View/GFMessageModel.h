//
//  GFMessageModel.h
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFBaseModel.h"

typedef NS_ENUM(NSInteger, GFMessageType) {
    GFMessageTypeText,
    GFMessageTypeImage,
    GFMessageTypePicture,
};

@interface GFMessageModel : GFBaseModel

@property (nonatomic,assign) BOOL *isSender;

@property (nonatomic,assign)  GFMessageType messageType;

@property (nonatomic,strong) NSString *content;

@property (nonatomic,strong) NSString *senderTime;

@property (nonatomic,assign) float audioDuration;

@property (nonatomic,strong) CGSize thumbnailSize;

@property (nonatomic,strong) UIImage *imageMessage;

@end
