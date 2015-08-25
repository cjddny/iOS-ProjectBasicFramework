//
//  ConstantsForDis.h
//  ZZB
//
//  Created by jwill on 15/3/6.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "Constants.h"


BOOL kProduction = YES;

BOOL kChecking = NO;

/**
 *  基本URL
 */
NSString* const kURL_BaseServerApiURL=@"http://api.zhangzhebang.com/api/v1/";
/**
 *  支付URL
 */
NSString* const kURL_BaseServerPayURL=@"http://m.zhangzhebang.com/api/";
/**
 *  用户注册
 */
NSString* const kURL_USERREGISTER_API=@"users/signup";
/**
 *  用户登录
 */
NSString* const kURL_USERLOGIN_API=@"auth/local";
/**
 *  用户登出
 */
NSString* const kURL_USERLOGOUT_API=@"users/signout";
/**
 *  获取验证码
 */
NSString* const kURL_GETCHECKCODE_API=@"checkcodes";
/**
 *  忘记密码
 */
NSString* const kURL_RESETGETPASSWORD_API=@"users/";  //users/{{mobile}}/password
/**
 *  发布主题
 */
NSString* const kURL_RELEASETOPICS_API=@"topics/publish";
/**
 *  获取广场列表
 */
NSString* const kURL_SQUARETOPICS_API=@"topics/list";
/**
 *  获取周边地址
 */
NSString* const kURL_GETNEARBY_API=@"maps/getPois/";
/**
 *  刷新token
 */
NSString* const kURL_REFRESHTOKEN_API=@"users/refreshToken";
/**
 *  获取会员级别及优惠
 */
NSString* const kURL_MEMBERINFO_API=@"vips/privileges";
/**
 *  点赞
 */
NSString* const kURL_SUPPORTS_API=@"topics/support";
/**
 *  生成会员订单
 */
NSString* const kURL_MEMBERORDER_API=@"vips";
/**
 *  回复主题
 */
NSString* const kURL_REPLAYTOPICS_API=@"topics/comment";
/**
 *  获取评论列表
 */
NSString* const kURL_GETCOMMENTLIST_API=@"topics/comment/";
/**
 *  上传附件地址
 */
NSString* const kURL_ATTACHMENTS_API=@"attachments";
/**
 *  修改用户资料
 */
NSString* const kURL_MODIFYUSER_API=@"users/";
/**
 *  修改密码
 */
NSString* const kURL_MODIFYPASSWORD_API=@"users/password";
/**
 *  验证密码
 */
NSString* const kURL_VERIFYPASSWORD_API=@"users/password/verify";
/**
 *  微信登陆
 */
NSString* const kURL_WECHATLOGIN_API=@"auth/weixin/mobile";
/**
 *  关注 OR 取消关注
 */
NSString* const kURL_FOLLOW_OR_UNFOLLOW_API=@"relationships/follow/";
/**
 *  所有我关注的人
 */
NSString* const kURL_MY_FOLLOWS_API=@"relationships/follow";
/**
 *  个人详情
 */
NSString* const kURL_USERDETAIL_API=@"users/";
/**
 *  绑定手机
 */
NSString* const kURL_BINDMOBILE_API=@"users/binding/weixin";
/**
 *  微信支付
 */
NSString* const kURL_WECHATPAY_API=@"wechats/pay";
/**
 *  搜索朋友
 */
NSString* const kURL_SEARCHFIRENDS_API=@"users/search?keywords";
/**
 *  版本更新
 */
NSString* const kURL_VERSIONCHECKER_API=@"appStore/ios/lastVersion?curVersion=";
/**
 *  商品列表
 */
NSString* const kURL_STOREITEMLIST_API=@"stores";
/**
 *  商品详情
 */
NSString* const kURL_STOREITEMDETIAL_API=@"products";
/**
 *  商品介绍
 */
NSString* const kURL_STOREITEMINTRODUCE_API=@"introductions";
/**
 *  添加到购物车
 */
NSString* const kURL_CART_API=@"stores/carts";
/**
 *  购物车结算
 */
NSString* const kURL_CART_API_ORDER_API=@"stores/carts/order";
/**
 *  订单列表查询
 */
NSString* const kURL_ORDER_LIST_API=@"orders";
/**
 *  发布活动
 */
NSString* const kURL_ACTIVITY_PUSH_API=@"activies/personal";
/**
 *  活动列表
 */
NSString* const kURL_ACTIVITY_LIST_API=@"activies";
/*
 *  活动详情
 */
NSString* const kURL_ACTIVITY_DETAIL_API=@"activies/";
/**
 * 评论--通用接口
 */
NSString* const kURL_COMMENT_API=@"comments";
/**
 *  活动筛选
 */
NSString* const kURL_ACTIVITY_OPTIONS_API=@"activies/options";
/**
 * 个人信息
 */
NSString* const kURL_MYINFO_API=@"users/me";
/**
 * 家人关系信息
 */
NSString* const kURL_FAMILYRELATION_API=@"relationships/families/";
/**
 * 同步通讯录
 */
NSString* const kURL_CONTACTLIST_API=@"relationships/contacts";
/**
 * 添加家人
 */
NSString* const kURL_ADDFAMILY_API=@"relationships/families/";
/**
 * 家人验证
 */
NSString* const kURL_FAMILYVALIDATELIST_API=@"relationships/families/validates";
/**
 * 设置提醒
 */
NSString* const kURL_SETREMINDER_API=@"reminders";
/**
 * 删除分享的广场
 */
NSString* const kURL_DETELE_SQUARE_API=@"topics/";
/**
 * 活动推广---
 */
NSString* const kURL_PROMOTIONS_API=@"activies/promotions";

//----------------------m.zhangzhebang用于分享
/**
 *  基本Web URL
 */
NSString* const kURL_BaseServerWebURL=@"http://m.zhangzhebang.com/";
/**
 *  活动详情Web URL
 */
NSString* const kURL_ActivityDetialWebURL=@"activity/item";
/**
 *  官网
 */
NSString* const kURL_HomePageURL=@"http://www.zhangzhebang.com/";

