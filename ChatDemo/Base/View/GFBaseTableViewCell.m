//
//  GFBaseTableViewCell.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFBaseTableViewCell.h"

@implementation GFBaseTableViewCell

+ (CGFloat) cellHeightWithTableView:(UITableView *)tableView cellModel:(GFBaseTableViewCellModel *)cellModel
{
    return cellModel.cellHeight;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end


@implementation GFBaseTableViewCellModel

+ (NSString *)identifier {
    return @"GFBaseTableViewCell";
}

@end