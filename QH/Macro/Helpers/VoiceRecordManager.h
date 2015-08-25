//
//  VoiceRecordManager.h
//  ZZB
//
//  Created by HuiYang on 15/8/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VoiceRecordManagerDelegate <NSObject>

@optional

/**
 *  点击头像
 *
 *  @param avatarUid
 */
- (void)voiceRecordManagerFinishRecoing:(NSString*)aPath andRecordDuration:(NSString*)recordDuration;

@end

@interface VoiceRecordManager : NSObject
@property(nonatomic,weak)id<VoiceRecordManagerDelegate> delegate;

-(instancetype)initWithSuperView:(UIView*)aSuperView;

#define mark 录音
- (void)didStartRecordingVoiceAction;

- (void)didCancelRecordingVoiceAction;
- (void)didFinishRecoingVoiceAction;

- (void)didDragOutsideAction ;
- (void)didDragInsideAction ;

@end
