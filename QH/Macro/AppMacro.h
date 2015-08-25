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

/**
 *  font
 */
#define kBoldFont(_size_) [UIFont boldSystemFontOfSize:_size_]
#define kSystemFont(_size_) [UIFont systemFontOfSize:_size_]

//---------------------app配色------------------
#define kAppThemeColor  colorFromHex(@"00a8b8")
#define kAppAssistColor colorFromHex(@"00a8b8")
#define kCellSeperatorLineColor colorFromHex(@"d8d8d8")

//---------------------app字体------------------
#define kAppNavBarFontTitle kBoldFont(20)
#define kAppNavBarFontSub kBoldFont(17)
#define kAppTabBarFontTitle kSystemFont(13)