//
//  GFChatMessageCell.h
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFBaseTableViewCell.h"
#import "GFMessageModel.h"

@interface GFChatMessageCellModel : GFBaseTableViewCellModel

@property (nonatomic,strong) GFMessageModel *messageModel;
@property(nonatomic,copy)   void(^messageItemWhenTapHandle)(id dataObj);
@property(nonatomic,copy) void(^tapImageHandle)(UIImageView *imageView);
@property(nonatomic,copy) void(^tapUserImageHandle)(id model);

@end

@interface GFChatMessageCell : GFBaseTableViewCell

@property(nonatomic,strong) GFChatMessageCellModel  *model;

+(CGFloat)cellHeightWithTableView:(UITableView *)tableView cellModel:(GFChatMessageCellModel *)cellModel;


@end
