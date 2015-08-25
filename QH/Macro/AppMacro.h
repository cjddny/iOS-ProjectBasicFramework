//
//  AppMacro.h
//  ZZB
//
//  Created by jwill on 15/2/5.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#ifndef ZZB_AppMacro_h
#define ZZB_AppMacro_h
#import "NSObject+NetworkDescription.h"
#import "UIViewController+UIBarButtonItem.h"

//fir bugHD token -------- 正式发布后可考虑去掉
#define FIRTOEKN @"bf7bb13e95c69143b6e3f48d5b4c039a"

//七牛基础网址
#define ZZBQiniuAddress @"http://zzb-api.qiniudn.com/"
/**
 *  最大录音时间
 */
#define kVoiceRecorderTotalTime 60.0

/**
 *  登录成功后存在本地
 */
#define kMemberInfoInLocalKey @"kMemberInfoInLocalKey"

/**
 *  微信授权成功后存在本地
 */
#define kWeiXinInfoInLocalKey @"kWeiXinInfoInLocalKey"

/**
 *  本地存储收货人信息
 */
#define kReceiverInfoInLocalKey @"kReceiverInfoInLocalKey"

/**
 *  本地存储默认收货人序号
 */
#define kReceiverIndexInLocalKey @"kReceiverIndexInLocalKey"

/**
 *  small Icon
 */
#define kAvatar90x90 @"?imageView2/1/w/90/h/90"
#define kAvatar100x100 @"?imageView2/1/w/100/h/100"
#define kAvatar150x150 @"?imageView2/1/w/150/h/150"
#define kAvatar200x200 @"?imageView2/1/w/200/h/200"
#define kAvatar250x250 @"?imageView2/1/w/250/h/250"
#define kAvatar300x300 @"?imageView2/1/w/300/h/300"
#define kAvatarScaleRate 0.5
/**
 *  筛选的通知
 */
#define kFilterNoticeName @"kFilterNoticeName--"
/**
 *  TMCache缓存分栏的KEY
 */
#define kTMCacheColumnsIDKey  @"ColumnsIDKey"
/**
 *  登录状态改变
 *
 *  @return
 */
#define kRefreshLoginStatus @"kRefreshLoginStatus"

#endif

/**
 *  广场cell状态
 */
static const Byte kZZBCellTypeText = 1;//文本消息
static const Byte kZZBCellTypeImage = 2;//图片消息
static const Byte kZZBCellTypeTypeVoice = 3;//语音消息
static const Byte kZZBCellTypeTextAndImage = 4;//文本+图片消息
static const Byte kZZBCellTypeTextAndVoice = 5;//文本+语音
static const Byte kZZBCellTypeVoiceAndImage = 6;//语音+图片
static const Byte kZZBCellTypeTextAndVoiceAndImage = 7;//文字+语音+图片
static const Byte kZZBCellTypeActivities = 8;//活动

/**
 *  我的cell状态
 */
#define kZZBMyStatusCellTypeText 1  //文本消息
#define kZZBMyStatusCellTypeImage 2 //图片消息
#define kZZBMyStatusCellTypeVoice 3 //语音信息
#define kZZBMyStatusCellTypeTextAndImage 4 //文本+图片消息
#define kZZBMyStatusCellTypeTextAndVoice 5 //文本+语音消息
#define kZZBMyStatusCellTypeVoiceAndImage 6 //图片+语音消息
#define kZZBMyStatusCellTypeTextAndVoiceAndImage 7 //文字+语音+图片

/**
 *  内测，更新app的url
 */
#define kAppUpdateTestDownloadURlKey @"kAppUpdateTestDownloadURlKey"
#define kAppHasNewVersionKey @"kAppHasNewVersionKey"
#define kNewIntroduceKey @"kNewIntroduceKey"

/**
 *  AppDelegate
 */
#define APP_DELEGATE [(AppDelegate*)[UIApplication sharedApplication] delegate]

/**
 *  kKeyWindow
 */
#define kKeyWindow [UIApplication sharedApplication].keyWindow

//---------------------常用颜色------------------
#define ZZBDarkGreenColor colorFromHex(@"00a8b8")
#define ZZBDarkOrgangeColor colorFromHex(@"eb9600")
#define ZZBBorderColor colorFromHex(@"ececec")
#define ZZBSpaceDarkWhite colorFromHex(@"fafafa")
#define ZZBSpaceGray colorFromHex(@"d9d9d9")
#define ZZBDarkGray colorFromHex(@"9f9f9f")
#define ZZBFontLightGray colorFromHex(@"cfcfcf")
#define ZZBBackgroundGray colorFromHex(@"f2f2f2")
#define ZZBBtnDisableGray colorFromHex(@"b3b3b3")
#define ZZBBgDarkGray colorFromHex(@"cccccc")
#define ZZBLineColor colorFromHex(@"ececec")
#define ZZBBottomBgColor colorFromHex(@"ebf5fe")
#define ZZBThemeColor colorFromHex(@"00a7b9")


#define ZZBLightBlackColor colorFromHex(@"535353")
#define ZZBLightRedColor colorFromHex(@"D9222E")
#define ZZBSBlackColor colorFromHex(@"4A4A4A")
#define ZZBDBlackColor colorFromHex(@"747474")
#define ZZBPayGray colorFromHex(@"fbfbfb")
#define ZZBSeperatorLineColor colorFromHex(@"d8d8d8")
#define ZZBStoreListGray colorFromHex(@"9b9b9b")
#define ZZBThemeOrangeColor colorFromHex(@"F6AC19")
#define ZZBThemeBlueColor colorFromHex(@"4A90E2")
#define ZZBThemeRedColor colorFromHex(@"D0021B")
#define ZZBThemeIntroduceColor colorFromHex(@"F9F8F4")


//--------------------随机用色------------------
#define kFamilyRandomColorArr @[colorFromHex(@"FF007E"),colorFromHex(@"FF0029"),colorFromHex(@"FF686D"),colorFromHex(@"CD39EB"),colorFromHex(@"FF68B0"),colorFromHex(@"FFD745"),colorFromHex(@"FF9100"),colorFromHex(@"FDB800"),colorFromHex(@"FF5A00"),colorFromHex(@"8B572A"),colorFromHex(@"485859"),colorFromHex(@"89C3EB"),colorFromHex(@"00A1FE"),colorFromHex(@"3EC6FF"),colorFromHex(@"00A3AF"),colorFromHex(@"65C921"),colorFromHex(@"54C7FC"),colorFromHex(@"FFCD00"),colorFromHex(@"FF2851"),colorFromHex(@"44DB5E"),colorFromHex(@"8E8E93")]

