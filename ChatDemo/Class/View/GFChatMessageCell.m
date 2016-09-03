//
//  GFChatMessageCell.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFChatMessageCell.h"
#import "MLEmojiLabel.h"

@interface GFChatMessageCell()

@property(nonatomic,strong) UIImageView  *usernameImageView;

@property(nonatomic,strong) UIImageView  *chatBackgroundView;

@property(nonatomic,strong) MLEmojiLabel  *contentLabel;

@property(nonatomic,strong) UILabel  *durationLabel;

@property(nonatomic,strong) UIImageView  *thumbnaiImage;

@property(nonatomic,strong) UILabel  *statusLabel;

@property(nonatomic,strong) UIImageView  *chatBackgroundCorner;

@property (nonatomic,strong) UIImageView *systemRemoteImageView;

@property(nonatomic,strong) UIButton  *voiceImageView;

@end

#define HRLabelWidth  [UIScreen mainScreen].bounds.size.width - 170
#define Default_Font_Size   14
#define Big_Font_Size       16

@implementation GFChatMessageCell {
    
    NSTimer *voiceTimer;
    NSInteger timeCount;
}

+(CGFloat)cellHeightWithTableView:(UITableView *)tableView cellModel:(GFChatMessageCellModel *)cellModel{
//    if (cellModel.messageModel.type == eMessageBodyType_Text) {
//        
//        NSString *imageName;
//        imageName = cellModel.messageModel.message.ext[@"isBigEmoji"] ? [NSString stringWithFormat:@"diy_mood_big_%@",cellModel.messageModel.message.ext[@"isBigEmoji"]] : nil;
//        
//        CGFloat fontSize = [cellModel.messageModel.content rangeOfString:@"["].location != NSNotFound ? Big_Font_Size : Default_Font_Size;
//        if (imageName) {
//            UIImage *moodImage = [UIImage imageNamed:imageName];
//            return moodImage.size.height;
//        }else{
//            return [HRChatManger labelHeightWithContent:cellModel.messageModel.content andFontSize:fontSize andContentWidth:HRLabelWidth].size.height + 20.0;
//        }
//        
//    }
//    
//    if (cellModel.messageModel.type == eMessageBodyType_Voice) {
//        return 40;
//    }
//    
//    if (cellModel.messageModel.type == eMessageBodyType_Image) {
//        CGFloat imageHeight = cellModel.messageModel.thumbnailSize.height > 100 ? cellModel.messageModel.thumbnailSize.height / 2 : cellModel.messageModel.thumbnailSize.height;
//        return imageHeight + 4; //20是上下边距
//    }
    
    return 0;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化视图
        _usernameImageView = [[UIImageView alloc]init];
        _usernameImageView.layer.cornerRadius = 20;
        _usernameImageView.layer.masksToBounds = YES;
        //        _usernameImageView.image = [UIImage imageNamed:@"touxiang"];
        _chatBackgroundView = [[UIImageView alloc]init];
        [self.contentView addSubview:_chatBackgroundView];
        
        _chatBackgroundCorner = [[UIImageView alloc]init];
        [self.contentView addSubview:_chatBackgroundCorner];
        
        [self.contentView addSubview:_usernameImageView];
        
        _contentLabel = [[MLEmojiLabel alloc]initWithFrame:CGRectZero];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = GFTextImpotColor02;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLabel.customEmojiRegex = @"\\[[a-zA-Z0-9@#$%\\^*()\\-\\+{}\\:;'\\|\\<]+\\]";
        _contentLabel.customEmojiPlistName = @"MoodImage";
        _contentLabel.customEmojiBundleName = @"MoodResource";
        [_chatBackgroundView addSubview:_contentLabel];
        
        _durationLabel = [[UILabel alloc]init];
        [_chatBackgroundView addSubview:_durationLabel];
        _durationLabel.textColor = GFColorFromHex(0x333333);
        _durationLabel.font = [UIFont systemFontOfSize:Default_Font_Size];
        
        _voiceImageView = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chatBackgroundView addSubview:_voiceImageView];
        
        _thumbnaiImage = [[UIImageView alloc]init];
        [_chatBackgroundView addSubview:_thumbnaiImage];
        _thumbnaiImage.userInteractionEnabled = YES;
        _thumbnaiImage.layer.cornerRadius = 5;
        _thumbnaiImage.layer.masksToBounds = YES;
        
        _statusLabel = [[UILabel alloc]init];
        _statusLabel.textColor = GFColorFromHex(0xaaaaaa);
        _statusLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_statusLabel];
        
    }
    
    return self;
}


- (void)setModel:(GFChatMessageCellModel *)model{
    _model = model;
    WS(weakSelf);
    [_usernameImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        model.messageModel.isSender ? make.right.mas_equalTo(-10) : make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(40);
    }];
    
    [_chatBackgroundCorner mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_usernameImageView.mas_centerY);
        model.messageModel.isSender ? make.right.equalTo(_usernameImageView.mas_left).offset(-3) : make.left.equalTo(_usernameImageView.mas_right).offset(3);
    }];
    
    
    _chatBackgroundView.image = model.messageModel.isSender ? [UIImage imageNamed:@"newchat_normal_background_right"] : [UIImage imageNamed:@"newchat_normal_background_left"];
    _chatBackgroundCorner.image = model.messageModel.isSender ? [UIImage imageNamed:@"newchat_corner_right"] : [UIImage imageNamed:@"newchat_corner_left_white"];
    
    
    //    NSURL *url = [NSURL URLWithString:[[ShareModel sharedInstance] getUserAvatar:model.messageModel.username sizeType:ZDDUserAvatarTypeSmall]];
    //    [_usernameImageView sd_setImageWithURL:url];
    [_usernameImageView setImage:[UIImage imageNamed:@"touxiang"]];
    
    [self configMessageType:model.messageModel];
    
    model.messageModel.messageType != GFMessageTypeText ? :  [self configTextAutoLayout:model.messageModel];
    model.messageModel.messageType != GFMessageTypeImage? :  [self configVoiceAutoLayout:model.messageModel];
    model.messageModel.messageType != GFMessageTypePicture? :  [self configImageAutoLaytou:model.messageModel];
    
    [_statusLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        model.messageModel.isSender ? make.right.equalTo(_chatBackgroundView.mas_left).offset(-6) : make.left.equalTo(_chatBackgroundView.mas_right).offset(6);
        make.centerY.mas_equalTo(0);
    }];
}

- (void)configVoiceAutoLayout:(GFMessageModel *)model{
    WS(weakSelf);
    CGFloat backWidth = (model.audioDuration / 60.00) * 100 + 100;
    [_chatBackgroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
        model.isSender ? make.right.equalTo(_chatBackgroundCorner.mas_left).offset(1) : make.left.equalTo(_chatBackgroundCorner.mas_right).offset(-1);
        make.top.mas_equalTo(3);
        make.bottom.equalTo(_usernameImageView.mas_bottom);
        make.width.mas_equalTo(backWidth > 200 ? 200 : backWidth);
    }];
    
    _durationLabel.textColor = model.isSender ? GFTextWhiteColor : GFColorFromHex(0x8f97a1);
    [_durationLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10) ;
        make.width.mas_equalTo(45);
    }];
    _durationLabel.text = [NSString stringWithFormat:@"%2.f",model.audioDuration];
    _durationLabel.textAlignment = NSTextAlignmentLeft;
    [_voiceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
    }];
    _voiceImageView.contentMode = UIViewContentModeLeft;
    
}
//
- (void)configImageAutoLaytou:(GFMessageModel *)model{
    WS(weakSelf);
    CGFloat imageWidth = model.thumbnailSize.width > 100 ? model.thumbnailSize.width / 2 : model.thumbnailSize.width;
    CGFloat imageHeight = model.thumbnailSize.height > 100 ? model.thumbnailSize.height / 2 : model.thumbnailSize.height;
    [_chatBackgroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
        model.isSender ? make.right.equalTo(_chatBackgroundCorner.mas_left).offset(1) : make.left.equalTo(_chatBackgroundCorner.mas_right).offset(-1);
        make.top.mas_equalTo(3);
        make.width.mas_equalTo(imageWidth + 4);
        make.height.mas_equalTo(imageHeight + 4);
    }];
    _chatBackgroundView.image = [UIImage imageNamed:@"newchat_normal_background_left"];
    _chatBackgroundCorner.image = model.isSender ? [UIImage imageNamed:@"newchat_corner_right_white"] : [UIImage imageNamed:@"newchat_corner_left_white"];
    
    [_thumbnaiImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        model.isSender ? make.right.mas_equalTo(-2) : make.left.mas_equalTo(2);
        make.top.mas_equalTo(2);
        make.width.mas_equalTo(imageWidth);
        make.height.mas_equalTo(imageHeight);
    }];
    
    _thumbnaiImage.image = model.imageMessage;
}
//
- (void)configMessageType:(GFMessageModel *)model{
    _voiceImageView.hidden = NO;
    _durationLabel.hidden = NO;
    _contentLabel.hidden = NO;
    _thumbnaiImage.hidden = NO;
    //    _userCardView.hidden = YES;
    
    if (model.messageType == GFMessageTypeText) {
        _voiceImageView.hidden = YES;
        _durationLabel.hidden = YES;
        _thumbnaiImage.hidden = YES;
        
    }
    if (model.messageType == GFMessageTypeImage) {
        _contentLabel.hidden = YES;
        _thumbnaiImage.hidden = YES;
    }
    
    if (model.messageType == GFMessageTypePicture) {
        _voiceImageView.hidden = YES;
        _durationLabel.hidden = YES;
        _contentLabel.hidden = YES;
    }
}


- (void)configTextAutoLayout:(GFMessageModel *)model{
    
    _chatBackgroundCorner.alpha = 1;
    
    
    CGFloat fontSize = [model.content rangeOfString:@"["].location != NSNotFound ? Big_Font_Size : Default_Font_Size;
    CGFloat width = [model.content rangeOfString:@"["].location != NSNotFound ? 10 : 5;
    CGRect labelRect = [self labelHeightWithContent:model.content andFontSize:fontSize andContentWidth:HRLabelWidth];
    [_chatBackgroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
        model.isSender ? make.right.equalTo(_chatBackgroundCorner.mas_left).offset(1) : make.left.equalTo(_chatBackgroundCorner.mas_right).offset(-1);
        make.top.mas_equalTo(3);
        make.width.mas_equalTo(labelRect.size.width + width + 20);
        make.bottom.mas_equalTo(0);
    }];
    
    
    CGFloat orginX = 10;
    CGFloat originY = 7;
    CGFloat contentHeight = 0;
    _contentLabel.textColor = model.isSender ? GFTextWhiteColor : GFTextImpotColor02;
    if ([model.content rangeOfString:@"["].location != NSNotFound) {
        _contentLabel.font =[UIFont systemFontOfSize:Big_Font_Size];
        _contentLabel.lineSpacing = 3;
        contentHeight += 7;
    }else{
        _contentLabel.font = [UIFont systemFontOfSize:Default_Font_Size];
        _contentLabel.lineSpacing = 0;
    }
    contentHeight += [self labelHeightWithContent:model.content andFontSize:fontSize andContentWidth:HRLabelWidth].size.height;
    [_contentLabel setFrame:CGRectMake(orginX, originY, labelRect.size.width + width, contentHeight)];
    _contentLabel.text = model.content;
    
}


- (void)beginVoiceAnimation:(NSTimer *)timer {
    
//    HRMessageModel *model = [timer.userInfo objectForKey:@"model"];
//    if (timeCount == 3) {
//        timeCount = 0;
//    }
//    timeCount++;
//    NSString *imageNameString = model.isSender ? @"message_voice_me_" : @"message_voice_other_";
//    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%.2zd",imageNameString,timeCount]];
//    [_voiceImageView setImage:image forState:UIControlStateSelected];
//    NSLog(@"___________%s",__func__);
    
}

- (CGRect)labelHeightWithContent:(NSString *)content andFontSize:(CGFloat)size andContentWidth:(CGFloat)width{
    CGFloat contentW = width;
    CGRect textRect = [content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size]} context:nil];
    
    return textRect;
}

@end
