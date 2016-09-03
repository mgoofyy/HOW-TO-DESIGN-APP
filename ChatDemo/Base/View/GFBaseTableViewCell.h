//
//  GFBaseTableViewCell.h
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFBaseTableViewCellModel : NSObject

@property (nonatomic, assign) CGFloat cellHeight;

+ (NSString *) identifier;

@end

@interface GFBaseTableViewCell : UITableViewCell

+(CGFloat)cellHeightWithTableView:(UITableView *)tableView cellModel:(GFBaseTableViewCellModel *)cellModel;

@end
