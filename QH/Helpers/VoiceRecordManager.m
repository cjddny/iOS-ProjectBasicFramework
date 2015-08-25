//
//  VoiceRecordManager.m
//  ZZB
//
//  Created by HuiYang on 15/8/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "VoiceRecordManager.h"
#import "VoiceRecordHelper.h"
#import "VoiceConverterManger.h"
#import "RecordHUD.h"

@interface VoiceRecordManager()

@property(nonatomic,strong)VoiceRecordHelper *voiceRecordHelper;
@property(nonatomic,strong)RecordHUD *voiceRecordHUD;

@property(nonatomic,strong)UIView *superView;

@end

@implementation VoiceRecordManager

-(instancetype)initWithSuperView:(UIView *)aSuperView
{
    self=[super init];
    if (self)
    {
        self.superView=aSuperView;
    }
    return self;
}

-(RecordHUD*)voiceRecordHUD
{
    if (!_voiceRecordHUD) {
        _voiceRecordHUD = [[RecordHUD alloc] initWithFrame:CGRectMake(0, 0, 140, 140)];
    }
    return _voiceRecordHUD;
}

- (VoiceRecordHelper *)voiceRecordHelper
{
    if (!_voiceRecordHelper)
    {
        @weakify(self)
        _voiceRecordHelper = [[VoiceRecordHelper alloc] init];
        _voiceRecordHelper.maxTimeStopRecorderCompletion = ^{
            @strongify(self)
            KSLOGBASIC_INFO(@"已经达到最大限制时间了，进入下一步的提示");
            [self didFinishRecoingVoiceAction];
        };
        WEAKSELF
        _voiceRecordHelper.peakPowerForChannel = ^(float peakPowerForChannel)
        {
            weakSelf.voiceRecordHUD.peakPower=peakPowerForChannel;
        };
        _voiceRecordHelper.maxRecordTime = kVoiceRecorderTotalTime;
    }
    return _voiceRecordHelper;
}

#define mark 录音
- (void)didStartRecordingVoiceAction
{
    KSLOGBASIC_INFO(@"didStartRecordingVoice");
    NSString *wavPath =[VoiceRecordHelper getPathByFileName:@"MyWavTemp" ofType:@"wav"];
    [self.voiceRecordHelper startRecordingWithPath:wavPath StartRecorderCompletion:^{
        
    }];
    NSLog(@"录制==[%@]",wavPath);
    
    [self.voiceRecordHUD startRecordingHUDAtView:self.superView];
    
}

- (void)didCancelRecordingVoiceAction {
    KSLOGBASIC_INFO(@"didCancelRecordingVoice");
    WEAKSELF
    [self.voiceRecordHUD cancelRecordCompled:^(BOOL fnished) {
        weakSelf.voiceRecordHUD = nil;
    }];
    
}

- (void)didFinishRecoingVoiceAction
{
    KSLOGBASIC_INFO(@"didFinishRecoingVoice");
    WEAKSELF
    @weakify(self)
    [self.voiceRecordHelper stopRecordingWithStopRecorderCompletion:^{
        @strongify(self)
        NSString *amrPath =[VoiceRecordHelper getPathByFileName:@"MyAmrTemp" ofType:@"amr"];
        
        if ([VoiceConverterManger wavToAmr:self.voiceRecordHelper.recordPath amrSavePath:amrPath]==0)
        {
            NSLog(@"转换成功=[%@]",amrPath);
            
            if ([weakSelf.delegate respondsToSelector:@selector(voiceRecordManagerFinishRecoing:andRecordDuration:)])
            {
                [weakSelf.delegate voiceRecordManagerFinishRecoing:amrPath andRecordDuration:weakSelf.voiceRecordHelper.recordDuration];
            }
            
        }
        
    }];
    NSLog(@"录制完成");
    [self.voiceRecordHUD stopRecordCompled:^(BOOL fnished) {
        weakSelf.voiceRecordHUD = nil;
    }];
    
}

- (void)didDragOutsideAction {
    KSLOGBASIC_INFO(@"didDragOutsideAction");
    [self.voiceRecordHUD resaueRecord];
    
}

- (void)didDragInsideAction {
    KSLOGBASIC_INFO(@"didDragInsideAction");
    [self.voiceRecordHUD resaueRecord];
    
}

@end
