
//
//  Constants.h
//  ZZB
//
//  Created by jwill on 15/3/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#ifndef ZZB_Constants_h
#define ZZB_Constants_h

extern  BOOL kProduction;

extern  BOOL kChecking;

/**
 *  基本URL
 */
extern NSString* const kURL_BaseServerApiURL;
/**
 *  支付URL
 */
extern NSString* const kURL_BaseServerPayURL;
/**
 *  用户注册
 */
extern NSString* const kURL_USERREGISTER_API;
/**
 *  用户登录
 */
extern NSString* const kURL_USERLOGIN_API;
/**
 *  微信登陆
 */
extern NSString* const kURL_WECHATLOGIN_API;
/**
 *  获取验证码
 */
extern NSString* const kURL_GETCHECKCODE_API;
/**
 *  忘记密码
 */
extern NSString* const kURL_RESETGETPASSWORD_API;
/**
 *  发布主题
 */
extern NSString* const kURL_RELEASETOPICS_API;
/**
 *  获取圈子
 */
extern NSString* const kURL_SQUARETOPICS_API;
/**
 *  获取周边地址
 */
extern NSString* const kURL_GETNEARBY_API;
/**
 *  refreshToken
 */
extern NSString* const kURL_REFRESHTOKEN_API;
/**
 *  获取会员级别及优惠
 */
extern NSString* const kURL_MEMBERINFO_API;
/**
 *  点赞
 */
extern NSString* const kURL_SUPPORTS_API;
/**
 *  生成会员订单
 */
extern NSString* const kURL_MEMBERORDER_API;
/**
 *  回复主题
 */
extern NSString* const kURL_REPLAYTOPICS_API;
/**
 *  获取评论列表
 */
extern NSString* const kURL_GETCOMMENTLIST_API;
/**
 *  上传附件地址
 */
extern NSString* const kURL_ATTACHMENTS_API;
/**
 *  修改用户资料
 */
extern NSString* const kURL_MODIFYUSER_API;
/**
 *  修改密码
 */
extern NSString* const kURL_MODIFYPASSWORD_API;
/**
 *  验证密码
 */
extern NSString* const kURL_VERIFYPASSWORD_API;
/**
 *  支付接口
 */
extern NSString* const kURL_PAYMENT_API;
/**
 *  关注 OR 取消关注
 */
extern NSString* const kURL_FOLLOW_OR_UNFOLLOW_API;
/**
 *  所有关注的人
 */
extern NSString* const kURL_MY_FOLLOWS_API;
/**
 *  个人详情
 */
extern NSString* const kURL_USERDETAIL_API;
/**
 *  绑定手机
 */
extern NSString* const kURL_BINDMOBILE_API;
/**
 *  微信支付
 */
extern NSString* const kURL_WECHATPAY_API;
/**
 *  搜索朋友
 */
extern NSString* const kURL_SEARCHFIRENDS_API;
/**
 *  版本更新
 */
extern NSString* const kURL_VERSIONCHECKER_API;
/**
 *  商品列表
 */
extern NSString* const kURL_STOREITEMLIST_API;
/**
 *  商品详情
 */
extern NSString* const kURL_STOREITEMDETIAL_API;
/**
 *  商品介绍
 */
extern NSString* const kURL_STOREITEMINTRODUCE_API;
/**
 *  (添加到/查看)购物车
 */
extern NSString* const kURL_CART_API;
/**
 *  购物车结算
 */
extern NSString* const kURL_CART_API_ORDER_API;
/**
 *  订单列表查询
 */
extern NSString* const kURL_ORDER_LIST_API;
/**
 *  发起活动
 */
extern NSString* const kURL_ACTIVITY_PUSH_API;
/**
 *  活动列表
 */
extern NSString* const kURL_ACTIVITY_LIST_API;
/**
 * 活动详情
 */
extern NSString* const kURL_ACTIVITY_DETAIL_API;
/**
 * 评论--通用接口
 */
extern NSString* const kURL_COMMENT_API;
/**
 *  活动筛选
 */
extern NSString* const kURL_ACTIVITY_OPTIONS_API;
/**
 * 个人信息
 */
extern NSString* const kURL_MYINFO_API;
/**
 * 家人关系信息
 */
extern NSString* const kURL_FAMILYRELATION_API;
/**
 * 同步通讯录
 */
extern NSString* const kURL_CONTACTLIST_API;
/**
 * 添加家人
 */
extern NSString* const kURL_ADDFAMILY_API;
/**
 * 家人验证
 */
extern NSString* const kURL_FAMILYVALIDATELIST_API;
/**
 * 设置提醒
 */
extern NSString* const kURL_SETREMINDER_API;
/**
 * 删除分享的广场
 */
extern NSString* const kURL_DETELE_SQUARE_API;
/**
 * 活动推广---
 */
extern NSString* const kURL_PROMOTIONS_API;

//----------------------m.zhangzhebang用于分享
/**
 *  基本Web URL
 */
extern NSString* const kURL_BaseServerWebURL;
/**
 *  活动详情Web URL
 */
extern NSString* const kURL_ActivityDetialWebURL;
/**
 *  官网
 */
extern NSString* const kURL_HomePageURL;


#endif
