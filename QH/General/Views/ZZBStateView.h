//
//  ZZBStateView.h
//  ZZB
//
//  Created by jwill on 15/6/30.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

typedef enum : NSUInteger
{
    eStateType_NetWorkError=1,
    eStateType_OrderEmpty=2,
    eStateType_AddressEmpty=3,
    eStateType_CartEmpty=4,
    eStateType_GoingActivityEmpty=5,
    eStateType_EndActivityEmpty=6,
    eStateType_CheckingActivityEmpty=7,
    eStateType_ParticipateActivityEmpty=8,
    eStateType_ContactEmpty=9,
    eStateType_FamilyValidateEmpty=10,
    eStateType_DataLoading=11,
    eStateType_ReminderEmpty=12,
    eStateType_FamilyChoseEmpty
} eStateType;

@protocol ZZBStateViewDelegate <NSObject>

@optional
-(void)pressEmptyImg;
@end

#define kDescribeIconSize 144
#import <UIKit/UIKit.h>

@interface ZZBStateView : UIView
@property(nonatomic,weak)id<ZZBStateViewDelegate>delegate;
//test
-(void)defaultPatch;
//配置加载类型
-(void)patchWithType:(eStateType)aType;
//结束动画
-(void)endAnimation;
@end
