//
//  ShareHelper.m
//  ZZB
//
//  Created by jwill on 15/8/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "ShareHelper.h"
#import "SDWebImageManager.h"
#import "UMSocialSnsPlatformManager.h"
#import "UMSocialSnsService.h"
#import "UMSocialDataService.h"
#import "UIImage+ImageCompress.h"
#import "NYXImagesKit.h"

#define kShareEndText @"#长者帮让黄昏充满友爱!"
#define kShareAppText @"长者帮是一款专门为老年人的晚年生活提供乐趣的和关爱的app,我推荐您下载"

@implementation ShareHelper
SYNTHESIZE_SINGLETON_FOR_CLASS(ShareHelper)


//根据缓存url分享图文
-(void)shareWithImageUrl:(NSString*)url text:(NSString*)text type:(EShareType)aType id:(NSString*)id onViewController:(UIViewController*)aVc
{
    NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:url]];
    UIImage *image=[[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
    if(image==nil)
    {
        //无缓存，则使用系统图片
        image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo@2x" ofType:@"jpg"]];
    }
    [self shareWithImage:image text:text type:aType id:id onViewController:aVc];
}

//分享图文
-(void)shareWithImage:(UIImage*)aImg text:(NSString*)text type:(EShareType)aType id:(NSString*)id onViewController:(UIViewController*)aVc
{
    //裁剪
    if(ABS(aImg.size.width-aImg.size.height)>10)
    {
        CGSize newSize=CGSizeMake(MIN(aImg.size.width, aImg.size.height), MIN(aImg.size.width, aImg.size.height));
        aImg=[aImg cropToSize:newSize usingMode:NYXCropModeBottomLeft];
    }
    
    //压缩图片
    NSData* imageDataSd = [UIImage compressImage:aImg compressType:ImageSizeStandard];
    UIImage *shareImg=[[UIImage alloc] initWithData:imageDataSd];
    
    
    NSString *shareUrl,*shareTitle,*shareText;

    switch (aType) {
        case EShareType_Activity://活动
            shareUrl=[NSString stringWithFormat:@"%@%@?id=%@",kURL_BaseServerWebURL,kURL_ActivityDetialWebURL,id];
            shareTitle=[NSString stringWithFormat:@"快来一起参加'%@'吧",text];
            shareText=[NSString stringWithFormat:@"%@%@",shareTitle,kShareEndText];
            break;
        case EShareType_App://app
            shareUrl=kURL_HomePageURL;
            shareTitle=[NSString stringWithFormat:@"%@推荐您下载长者帮",text];
            shareText=[NSString stringWithFormat:@"%@%@",kShareAppText,kShareEndText];
            break;
        default:
            break;
    }

    [UMSocialData defaultData].extConfig.wechatSessionData.url = shareUrl;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = shareUrl;
    [UMSocialData defaultData].extConfig.qqData.url = shareUrl;
    
    [UMSocialData defaultData].extConfig.wechatSessionData.title = shareTitle;
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = shareTitle;
    [UMSocialData defaultData].extConfig.qqData.title = shareTitle;


    NSArray *shareType =[NSArray arrayWithObjects:UMShareToSina,UMShareToQQ,UMShareToSms,UMShareToWechatSession,UMShareToWechatTimeline, nil];
    [UMSocialSnsService presentSnsIconSheetView:aVc appKey:kUmengAppkey shareText:shareText shareImage:shareImg shareToSnsNames:shareType delegate:nil];
}
@end
