//
//  DKFilterView.m
//  Partner
//
//  Created by Drinking on 14-12-20.
//  Copyright (c) 2014年 zhinanmao.com. All rights reserved.
//

#import "DKFilterView.h"
#import "DKFilterCell.h"
#import <Masonry/Masonry.h>
#import "DKFilterModel.h"

@interface DKFilterView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITableView *pickTableView;
@property (nonatomic,strong) UIPickerView *picker;
@property (nonatomic,strong) NSArray *pickerChoices;
@property (nonatomic,strong) DKFilterModel *selectingModel;
@property (nonatomic,assign) CGFloat defaultPickerViewHeight;

@end

@implementation DKFilterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.defaultPickerViewHeight = 100;

        self.filterModels = @[];
        self.pickerChoices = @[];
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView setShowsVerticalScrollIndicator:NO];
        [_tableView setShowsHorizontalScrollIndicator:NO];
        _tableView.scrollEnabled=NO;
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                        selector:@selector(showPickerView:)
                                        name:DK_NOTIFICATION_PICKITEM object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(filterButtonClicked:)
                                         name:DK_NOTIFICATION_BUTTON_CLICKED object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(getFilterButtonClicked:)
                                                     name:DK_GETFILEDATA_BUTTONS object:nil];
    }
    
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)showPickerView:(NSNotification*)notification{
    NSInteger index = [notification.object integerValue];
    DKFilterModel *data = (DKFilterModel *)[self.filterModels objectAtIndex:index];
    self.selectingModel = data;
    self.pickerChoices = data.choices;
    [self hidePickerView:NO];
}

- (void)filterButtonClicked:(NSNotification*)notification
{
    if (self.delegate && [self.delegate respondsToSelector:
                          @selector(didClickAtModel:)]) {
        return [self.delegate didClickAtModel:notification.object];
    }
}

- (void)getFilterButtonClicked:(NSNotification*)notification
{
    if (self.delegate && [self.delegate respondsToSelector:
                          @selector(didGetFilterDatas:)]) {
        return [self.delegate didGetFilterDatas:notification.object];
    }
}

//MARK: UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _pickTableView) {
        return self.pickerChoices.count;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _pickTableView) {
        return 1;
    }else{
        return self.filterModels.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _pickTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"popfilterdatacell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                           reuseIdentifier:@"popfilterdatacell"];
        }
        
        cell.textLabel.text = self.pickerChoices[indexPath.row];
        return cell;
    }else{
        DKFilterModel *model = self.filterModels[indexPath.section];
        CGFloat width  = CGRectGetWidth(self.frame);
        if (!model.cachedView || CGRectGetWidth(model.cachedView.frame) != width)
        {
            model.cachedView = [model getCustomeViewofWidth:width];
        }
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:@"filterdatacell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:model.cachedView];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _pickTableView) {
        return 50;
    }else{
        DKFilterModel *model = self.filterModels[indexPath.section];
        CGFloat width  = CGRectGetWidth(self.frame);
        if (!model.cachedView) {
            model.cachedView = [model getCustomeViewofWidth:width];
        }
        
        DKFilterCell *selectView = (DKFilterCell *)model.cachedView;
        if (selectView.maxViewWidth != width) {
            model.cachedView = [model getCustomeViewofWidth:width];
            selectView = (DKFilterCell *)model.cachedView;
        }
        
        return [selectView getEstimatedHeight];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == _pickTableView) {
        return 0;
    }else{
        if (self.delegate && [self.delegate respondsToSelector:
                              @selector(getCustomSectionHeaderHeight)]) {
            return [self.delegate getCustomSectionHeaderHeight];
        }
        
        return 40;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (tableView == _pickTableView) {
        return [UIView new];
    }else{
        DKFilterModel *model = self.filterModels[section];
        
        if (self.delegate && [self.delegate respondsToSelector:
                              @selector(getCustomSectionHeader)]) {
            DKFilterSectionHeaderView *header = [self.delegate getCustomSectionHeader];
            [header setSectionHeaderTitle:model.title];
            return header;
        }
        
        CGFloat width = CGRectGetWidth(self.frame);
        UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 40)];
        

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, width, 21)];
        titleLabel.textColor = DK_DEFAULT_TITLE_COLOR;
        titleLabel.text = model.title;
        UIView *seperator = [[UIView alloc] initWithFrame:CGRectMake(10, 38, width-20, 1)];
        seperator.backgroundColor = DK_DEFAULT_TITLE_COLOR;
        
        [bg addSubview:titleLabel];
        [bg addSubview:seperator];
        return bg;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _pickTableView) {
        if(self.selectingModel){
            DKFilterCell *view = (DKFilterCell *)self.selectingModel.cachedView;
            [view setSelectedChoice:[self.pickerChoices objectAtIndex:indexPath.row]];
        }
        [self hidePickerView:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        
        CGFloat sectionHeaderHeight = 40;
        if (self.delegate && [self.delegate respondsToSelector:
                              @selector(getCustomSectionHeaderHeight)]) {
             sectionHeaderHeight = [self.delegate getCustomSectionHeaderHeight];
        }

        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

- (UITableView *)pickTableView{
    if (!_pickTableView) {
        _pickTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _pickTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _pickTableView.dataSource = self;
        _pickTableView.delegate = self;
        _pickTableView.tableFooterView = [UIView new];
        _pickTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:_pickTableView];
    }
    return _pickTableView;
}

- (void)hidePickerView:(BOOL)hide{
    if (!hide) {
        [self.pickTableView reloadData];
    }
    
    if (CGRectEqualToRect(self.pickTableView.frame, CGRectZero)) {
        CGFloat width = CGRectGetWidth(self.frame);
        CGFloat height = CGRectGetHeight(self.frame);
        self.pickTableView.frame = CGRectMake(0, height, width, 0);
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat width = CGRectGetWidth(self.frame);
        if (hide) {
            CGFloat height = CGRectGetHeight(self.frame);
            self.pickTableView.frame = CGRectMake(0, height, width, 0);
        }else{
            CGFloat height = CGRectGetHeight(self.frame);
            self.pickTableView.frame = CGRectMake(0, 0, width, height);
        }
    }];
}

- (void)setFilterModels:(NSArray *)models{
    [models enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       DKFilterModel *model = (DKFilterModel *)obj;
        model.tag = idx;
    }];
    _filterModels = models;
    [self.tableView reloadData];
}

@end