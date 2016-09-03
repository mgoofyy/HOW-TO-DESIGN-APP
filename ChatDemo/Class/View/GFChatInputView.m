//
//  GFChatInputView.m
//  ChatDemo
//
//  Created by goofygao on 9/3/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFChatInputView.h"
#import "GFChatCustomTextView.h"

@interface GFChatInputView ()

@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong) UIButton *emojiButton;
@property (nonatomic,strong) UIButton *audioButton;
@property (nonatomic,strong) UIButton *changeButton;
@property (nonatomic,strong) GFChatCustomTextView *chatTextView;

@end

@implementation GFChatInputView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configCurrentView];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self configCurrentView];
    }
    return self;
}

- (void)configCurrentView {
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _emojiButton = [UIButton new];
    _audioButton = [UIButton new];
    _changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _chatTextView = [GFChatCustomTextView new];
    [self addSubview:self.moreButton];
    [self addSubview:self.emojiButton];
    [self addSubview:self.audioButton];
    [self addSubview:self.changeButton];
    [self addSubview:self.chatTextView];
 
//    config
    [_changeButton setImage:[UIImage imageNamed:@"normal_voice"] forState:UIControlStateNormal];
    [_changeButton setImage:[UIImage imageNamed:@"normal_keyboard"] forState:UIControlStateSelected];
    [_changeButton addTarget:self action:@selector(changeInputTypeAction:) forControlEvents:UIControlEventTouchDown];
    
    [_emojiButton setImage:[UIImage imageNamed:@"normal_emoji"] forState:UIControlStateNormal];
    [_emojiButton addTarget:self action:@selector(emojiAction:) forControlEvents:UIControlEventTouchDown];
    
    [_moreButton setImage:[UIImage imageNamed:@"normal_more"] forState:UIControlStateNormal];
    [_moreButton addTarget:self action:@selector(moreItemsAction:) forControlEvents:UIControlEventTouchDown];
    
    [_chatTextView kc_setLayerCornerRadiusWithClips:4];
    [_chatTextView setBackgroundColor:GFTextWhiteColor];
    [_chatTextView setBackgroundColor:GFColorFromHex(0xffffff)];
    _chatTextView.layer.borderColor = GFColorFromHex(0xc8c8cd).CGColor;
    _chatTextView.layer.borderWidth = 0.5;
    [_chatTextView kc_setLayerCornerRadiusWithClips:4.0];
    _chatTextView.font = [UIFont systemFontOfSize:16];
    _chatTextView.returnKeyType = UIReturnKeySend;
    
    [_audioButton setBackgroundImage:[UIImage imageNamed:@"voice_send_back_normal"] forState:UIControlStateNormal];
    [_audioButton setBackgroundImage:[UIImage imageNamed:@"voice_send_back_select"] forState:UIControlStateHighlighted];
    [_audioButton setTitle:@"按住 说话" forState:UIControlStateNormal];
    [_audioButton setTitle:@"松开 结束" forState:UIControlStateHighlighted];
    _audioButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_audioButton setTitleColor:GFTextImpotColor02 forState:UIControlStateNormal];
    [_audioButton setTitleColor:GFTextImpotColor02 forState:UIControlStateHighlighted];
    [_audioButton kc_setLayerCornerRadiusWithClips:4.0];
//    [_audioButton addTarget:self action:@selector(bottomToolClick:) forControlEvents:UIControlEventTouchUpInside];
//    [_audioButton addTarget:self action:@selector(voiceSendTouchDown:) forControlEvents:UIControlEventTouchDown];
//    [_audioButton addTarget:self action:@selector(voiceSendTouchDragIn:) forControlEvents:UIControlEventTouchDragInside];
//    [_audioButton addTarget:self action:@selector(voiceSendTouchDragOut:) forControlEvents:UIControlEventTouchDragOutside];
//    [_audioButton addTarget:self action:@selector(voiceSendTouchOut:) forControlEvents:UIControlEventTouchUpOutside];
    _audioButton.hidden = YES;
    
    [_changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(30);
    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(30);
    }];
    
    [_emojiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_moreButton.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(30);
    }];
    
    [_chatTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_changeButton.mas_right).offset(10);
        make.right.mas_equalTo(_emojiButton.mas_left).offset(-10);
        make.top.mas_equalTo(_changeButton.mas_top).offset(-2);
        make.bottom.mas_equalTo(_changeButton.mas_bottom).offset(2);
    }];
    
    [_audioButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_changeButton.mas_right).offset(10);
        make.right.mas_equalTo(_emojiButton.mas_left).offset(-10);
        make.top.mas_equalTo(_changeButton.mas_top).offset(-2);
        make.bottom.mas_equalTo(_changeButton.mas_bottom).offset(2);
    }];
}

#pragma mark - action

- (void)changeInputTypeAction:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    _chatTextView.hidden = sender.isSelected;
    _audioButton.hidden = !sender.isSelected;
    !sender.selected ? [_chatTextView becomeFirstResponder] : [_chatTextView resignFirstResponder];
}

- (void)emojiAction:(UIButton *)sender {
    
}

- (void)moreItemsAction:(UIButton *)sender {
    
}

@end
