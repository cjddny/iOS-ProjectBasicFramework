//
//  ZZBStateView.m
//  ZZB
//
//  Created by jwill on 15/6/30.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "ZZBStateView.h"

@interface ZZBStateView()
@property(nonatomic,strong)UILabel *describeLab;
@property(nonatomic,strong)UIImageView *describeImg;
@property(nonatomic,strong)NSArray *loadingArr;
@property(nonatomic,strong)UIImageView *surrenderImg;
@property(nonatomic,assign)float rotateAngle;
@property(nonatomic,assign)BOOL rotating;
@end

@implementation ZZBStateView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame=CGRectMake(0, 0, kScreen_Width, kScreen_Width);
        self.backgroundColor=[UIColor clearColor];
        int random = arc4random()%2;
        _loadingArr=(random)?@[[UIImage imageNamed:@"ManLoading1"],
                               [UIImage imageNamed:@"ManLoading2"],
                               [UIImage imageNamed:@"ManLoading3"],
                               [UIImage imageNamed:@"ManLoading4"],
                               [UIImage imageNamed:@"ManLoading5"],
                               [UIImage imageNamed:@"ManLoading6"],
                               [UIImage imageNamed:@"ManLoading7"],
                               [UIImage imageNamed:@"ManLoading8"],
                               [UIImage imageNamed:@"ManLoading9"]
                               ]:@[[UIImage imageNamed:@"WomanLoading1"],
                                   [UIImage imageNamed:@"WomanLoading2"],
                                   [UIImage imageNamed:@"WomanLoading3"],
                                   [UIImage imageNamed:@"WomanLoading4"],
                                   [UIImage imageNamed:@"WomanLoading5"],
                                   [UIImage imageNamed:@"WomanLoading6"],
                                   [UIImage imageNamed:@"WomanLoading7"],
                                   [UIImage imageNamed:@"WomanLoading8"],
                                   [UIImage imageNamed:@"WomanLoading9"]
                                   ];
        [self buildUI];
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"释放");
    _describeImg=nil;
    _loadingArr=nil;
}

#pragma mark -- UI
//基础化UI布局
-(void)buildUI
{
    //描述文字
    _describeLab =({
        UILabel *label=[UILabel new];
        label.font=[UIFont boldSystemFontOfSize:20];
        label.textColor=[UIColor blackColor];
        label.textAlignment=NSTextAlignmentCenter;
        label.adjustsFontSizeToFitWidth=TRUE;
        label;
    });
    [self addSubview:_describeLab];
    
    //描述图片
    _describeImg=[UIImageView new];
    _describeImg.userInteractionEnabled=YES;
    
//    //增加单击手势监控
//    self.avatarTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressDescribeAction)];
//    [_describeImg addGestureRecognizer:self.avatarTap];
    [self addSubview:_describeImg];
    
    
    _surrenderImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loading_loop"]];
    [self addSubview:_surrenderImg];
    
    _rotateAngle=0;
    
    [self updateUIConstraints];
}

//增加约束 UI 适配
-(void)updateUIConstraints
{
    [_describeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(20));
        make.top.equalTo(_describeImg.mas_bottom).offset(20);
    }];
    
    [_describeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kDescribeIconSize, kDescribeIconSize));
        make.centerY.equalTo(self.mas_centerY).offset(-60);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [_surrenderImg mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
}

//区别显示布局
-(void)updateShowConstraints:(eStateType)aType
{
    [self endAnimation];
    if (aType==eStateType_DataLoading) {
        [_describeImg mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 70));
            make.center.equalTo(self);
        }];
        _surrenderImg.hidden=FALSE;
        _rotating=TRUE;
        [self startAnimation];
        [self startGifAnimation];
    }else
    {
        [_describeImg mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kDescribeIconSize, kDescribeIconSize));
            make.centerY.equalTo(self.mas_centerY).offset(-60);
            make.centerX.equalTo(self.mas_centerX);
        }];
        [self endAnimation];
        _surrenderImg.hidden=TRUE;
    }
}

//test
-(void)defaultPatch
{
    _describeLab.text=@"网络有点问题";
    [_describeImg setImage:[UIImage imageNamed:@"icon_state_networkError"]];
}

//配置加载类型
-(void)patchWithType:(eStateType)aType
{
    switch (aType) {
        case eStateType_NetWorkError:
            _describeLab.text=@"网络有点问题!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_networkError"]];
            break;
        case eStateType_OrderEmpty:
            _describeLab.text=@"还没有订单,快去逛逛吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyOrder"]];
            break;
        case eStateType_AddressEmpty:
            _describeLab.text=@"还没有收货地址,快去添加吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyAdress"]];
            break;
        case eStateType_CartEmpty:
            _describeLab.text=@"购物车还是空的，快去逛逛吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyCart"]];
            break;
        case eStateType_DataLoading:
            _describeLab.text=@"";
            [_describeImg setImage:[UIImage imageNamed:@"loading_loop"]];
            break;
        case eStateType_GoingActivityEmpty:
            _describeLab.text=@"还没有活动,快去发布吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyGoingActivity"]];
            break;
        case eStateType_CheckingActivityEmpty:
            _describeLab.text=@"还没有活动,快去发布吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyCheckingActivity"]];
            break;
        case eStateType_EndActivityEmpty:
            _describeLab.text=@"还没有活动,快去发布吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyEndActivity"]];
            break;
        case eStateType_ParticipateActivityEmpty:
            _describeLab.text=@"还没参加活动,快去和小伙伴一起玩耍吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyParticipateActivity"]];
            break;
        case eStateType_ContactEmpty:
            _describeLab.text=@"还没有通讯录好友使用长者帮,快去邀请吧!";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyContact"]];
            break;
        case eStateType_FamilyValidateEmpty:
            _describeLab.text=@"还没有待验证的家人申请~";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyFamilyValidate"]];
            break;
        case eStateType_ReminderEmpty:
            _describeLab.text=@"还没有任何提醒~";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_emptyReminder"]];
            break;
        case eStateType_FamilyChoseEmpty:
            _describeLab.text=@"还没有验证的家人，去添加家人吧~";
            [_describeImg setImage:[UIImage imageNamed:@"icon_state_FamilyChoseEmpty"]];
            break;
        default:
            break;
    }
    
    [self updateShowConstraints:aType];
    
}

//开始动画
-(void)startAnimation
{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(self.rotateAngle * (M_PI / 180.0f));
    //边框动画
    WEAKSELF
    [UIView animateWithDuration:0.1f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _surrenderImg.transform = endAngle;
    } completion:^(BOOL finished) {
        if (weakSelf.rotating) {
            weakSelf.rotateAngle += 10;
            [weakSelf startAnimation];
        }
    }];
}

-(void)startGifAnimation
{
    //内容动画
    _describeImg.animationImages = _loadingArr; //动画图片数组
    _describeImg.animationDuration = 1.2; //执行一次完整动画所需的时长
    _describeImg.animationRepeatCount = 0;  //动画重复次数
    [_describeImg startAnimating];
}

//结束动画
-(void)endAnimation
{
    _rotating=FALSE;
    [_surrenderImg stopAnimating];
    [_describeImg stopAnimating];
    
    [_surrenderImg.layer removeAllAnimations];
    [_describeImg.layer removeAllAnimations];
}

//点击事件
-(void)pressDescribeAction
{
    if ([self.delegate respondsToSelector:@selector(pressEmptyImg)]) {
        [self.delegate pressEmptyImg];
    }
}

@end
