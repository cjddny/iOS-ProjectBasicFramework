//
//  DKRadioSelectView.m
//  Partner
//
//  Created by Drinking on 14-12-19.
//  Copyright (c) 2014年 zhinanmao.com. All rights reserved.
//

#import "DKFilterCell.h"
#import "DKFilterModel.h"
#import "DKMacros.h"

@interface DKFilterCell()

@property (nonatomic,strong) NSMutableArray *buttons;
@property (nonatomic,strong) NSMutableArray *selectedbuttons;
@property (nonatomic,weak) DKFilterModel *filterData;

@property (nonatomic,strong) UIButton *selectingButton;
@end

@implementation DKFilterCell

- (instancetype)init{
    if (self = [super init]) {
        _buttonWidth = 94;
        _buttonHeight = 30;
        _paddingHorizontal = 8;
        _paddingVertical = 9;
        _paddingBottom = 0;
        _maxViewWidth = 320;
        self.buttonNormalColor = DK_NORMAL_COLOR;
        self.buttonHighlightColor = kAppThemeColor;
    }
    return self;
}

- (instancetype)init:(DKFilterModel *) model Width:(CGFloat) width
{
    if (self = [self init])
    {
        _filterData = model;
        _maxViewWidth = width;
        _selectedbuttons = [[NSMutableArray alloc] initWithCapacity:15];
        _buttons = [[NSMutableArray alloc] initWithCapacity:_filterData.elements.count];
        
        UIView *subView = [UIView new]; // If there is no subview
        subView.tag = 444;              //it won't invoke layoutSubviews
        [self addSubview:subView];      //it will be removed after buttons initialization
//        self.backgroundColor=[UIColor redColor];
        
    }
    return self;
}

- (void)initButtons
{
    [_buttons removeAllObjects];
    [_filterData.elements enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _buttonWidth, _buttonHeight)];
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 2;
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        button.titleLabel.minimumScaleFactor = 0.5;
        [button setTitle:obj forState:UIControlStateNormal];
        [button setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
        button.layer.borderColor = [self.buttonNormalColor CGColor];
        button.selected = NO;
        button.tag = idx;
        [button addTarget:self action:@selector(buttonSelected:)
         forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [_buttons addObject:button];
    }];
    

//    [self configSelectedButtonsWithValues:@[@"棋牌",@"养生"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_buttons.count !=_filterData.elements.count) {
        [self initButtons];
        [[self viewWithTag:444] removeFromSuperview];
    }
    
    self.frame = CGRectMake(0, 0, _maxViewWidth, [self getEstimatedHeight]);
    
    NSInteger width = _maxViewWidth;
    NSInteger buttonInRow = width/(_paddingHorizontal + _buttonWidth);
    
    CGFloat originX=0;
    
    if (self.filterData.style==DKFilterViewStylePush)
    {
        originX =2;
    }else
    {
        
        originX = (width - buttonInRow *(_paddingHorizontal + _buttonWidth) + _paddingHorizontal)/2;
    }
    
    [_buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSInteger startY = _paddingVertical + (idx/buttonInRow)*(_buttonHeight+_paddingVertical);
        NSInteger startX = originX + (idx%buttonInRow)*(_paddingHorizontal + _buttonWidth);
        UIButton *button = (UIButton *)obj;
        button.tag = idx;
        button.frame = CGRectMake(startX, startY, _buttonWidth, _buttonHeight);
    }];
}

- (void)buttonSelected:(UIButton *)button
{
    if (self.filterData.style==DKFilterViewStylePush)
    {
        if (self.selectedbuttons.count>=3 && ![self.selectedbuttons containsObject:button])
        {
            KAlert(@"最多只能添加3个主题标签");
            return;
        }
    }
    
    self.filterData.clickedButtonText = button.titleLabel.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:DK_NOTIFICATION_BUTTON_CLICKED
                                          object:self.filterData];
    
    if (self.filterData.type == DK_SELECTION_SINGLE) {
        if (button.selected) {
            [button setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            button.layer.borderColor = [self.buttonNormalColor CGColor];
            button.selected = NO;
            [self.selectedbuttons removeObject:button];
        }else{
            for (UIButton *button in self.selectedbuttons) {
                [button setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
                button.layer.borderColor = [self.buttonNormalColor CGColor];
                button.selected = NO;
            }
            
            [self.selectedbuttons removeAllObjects];
            
            button.layer.borderColor = [self.buttonHighlightColor CGColor];
            [button setTitleColor:self.buttonHighlightColor forState:UIControlStateNormal];
            button.selected = YES;
            [self.selectedbuttons addObject:button];
        }
        
    }else if(self.filterData.type == DK_SELECTION_MULTIPLE){
        if (button.selected)
        {
            [button setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            button.layer.borderColor = [self.buttonNormalColor CGColor];
            button.selected = NO;
            [self.selectedbuttons removeObject:button];
        }else
        {
            button.layer.borderColor = [self.buttonHighlightColor CGColor];
            [button setTitleColor:self.buttonHighlightColor forState:UIControlStateNormal];
            button.selected = YES;
            [self.selectedbuttons addObject:button];
        }
    }else if(self.filterData.type == DK_SELECTION_PICK){
        
        if (button.selected) {
            [button setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            button.layer.borderColor = [self.buttonNormalColor CGColor];
            button.selected = NO;
            [button setTitle:DK_ADD forState:UIControlStateNormal];
            [self.selectedbuttons removeObject:button];
        }else{
            self.selectingButton = button;
            [[NSNotificationCenter defaultCenter] postNotificationName:DK_NOTIFICATION_PICKITEM
                                                  object:@(self.filterData.tag)];
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DK_GETFILEDATA_BUTTONS
                                                        object:[self getSelectedValues]];
}

- (CGFloat)getEstimatedHeight
{
    NSInteger width = _maxViewWidth;
    NSInteger buttonInRow = width/(_paddingHorizontal + _buttonWidth);
    NSInteger rows = 1+ _filterData.elements.count/buttonInRow;
    if (_filterData.elements.count%buttonInRow == 0) {
        rows -=1;
    }
    CGFloat estimatedHeight = rows *(_paddingVertical + _buttonHeight) + _paddingBottom;
    return estimatedHeight;
    
}

- (void)setSelectedChoice:(NSString *)choice{
    if(self.selectingButton){
        [self.selectingButton setTitle:choice forState:UIControlStateNormal];
        self.selectingButton.layer.borderColor = [self.buttonHighlightColor CGColor];
        [self.selectingButton setTitleColor:self.buttonHighlightColor forState:UIControlStateNormal];
        self.selectingButton.selected = YES;
        [self.selectedbuttons addObject:self.selectingButton];
    }
    self.selectingButton = nil;
}

- (NSArray *)getSelectedValues{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (UIButton *button in self.selectedbuttons)
    {
        [array addObject:button.titleLabel.text];
    }
    return array;
}

-(void)configSelectedButtonsWithValues:(NSArray *)values
{
    if (values.count<1)
        return;
    
    for (NSString *title in values)
    {
        for (UIButton *btn in _buttons)
        {
            if ([title isEqualToString:btn.titleLabel.text])
            {
                btn.layer.borderColor = [self.buttonHighlightColor CGColor];
                [btn setTitleColor:self.buttonHighlightColor forState:UIControlStateNormal];
                btn.selected = YES;
                [self.selectedbuttons addObject:btn];
            }
        }
    }
}

@end
