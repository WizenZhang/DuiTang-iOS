//
//  WZSettingCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSettingCell.h"
#import "WZSettingItem.h"
#import "WZSettingSwitchItem.h"
#import "WZSettingArrowItem.h"
#import "WZSettingLabelItem.h"
#import "JXLDayAndNightMode.h"
@interface WZSettingCell()
/**
 *  箭头
 */
@property (nonatomic, strong) UIImageView *arrowView;
/**
 *  开关
 */
@property (nonatomic, strong) UISwitch *switchView;
/**
 *  标签
 */
@property (nonatomic, strong) UILabel *labelView;
@end

@implementation WZSettingCell
- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
        
        //设置日间和夜间两种状态模式
        [self setDayAndNight];
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];

        if (JXLDayAndNightModeDay == [[JXLDayAndNightManager shareManager] contentMode]) {
            _switchView.on = NO;
        } else {
            _switchView.on = YES;
        }
        self.accessoryView = _switchView;
        [_switchView addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
        
        //设置日间和夜间两种状态模式
        [self setDayAndNight];
    }
    return _switchView;
}
/**
 *  设置日间和夜间两种状态模式
 */
- (void)setDayAndNight
{
    //设置日间和夜间两种状态模式
    [self jxl_setDayMode:^(UIView *view) {
        WZSettingCell *cell = (WZSettingCell *)view;
        cell.backgroundColor = [UIColor whiteColor];
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
    } nightMode:^(UIView *view) {
        WZSettingCell *cell = (WZSettingCell *)view;
        cell.backgroundColor = WZNightCellColor;
        cell.contentView.backgroundColor = WZNightCellColor;
        cell.textLabel.backgroundColor = WZNightCellColor;
        cell.textLabel.textColor = [UIColor whiteColor];
    }];
}

- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 30);
        _labelView.backgroundColor = [UIColor redColor];
        
        //设置日间和夜间两种状态模式
        [self setDayAndNight];

    }
    return _labelView;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"setting";
    WZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WZSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
    
    
}

- (void)switchValueChange:(UISwitch *)switchView {
    if (_switchView.on) {
        
        [[JXLDayAndNightManager shareManager] nightMode];
    } else {
        [[JXLDayAndNightManager shareManager] dayMode];
    }
}
- (void)setItem:(WZSettingItem *)item
{
    _item = item;
    
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边的内容
    [self setupRightContent];
}

/**
 *  设置右边的内容
 */
- (void)setupRightContent
{
    if ([self.item isKindOfClass:[WZSettingArrowItem class]]) { // 箭头
        self.accessoryView = self.arrowView;
    } else if ([self.item isKindOfClass:[WZSettingSwitchItem class]]) { // 开关
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([self.item isKindOfClass:[WZSettingLabelItem class]]) { // 标签
        self.accessoryView = self.labelView;
    } else {
        self.accessoryView = nil;
    }
}

/**
 *  设置数据
 */
- (void)setupData
{
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
}

@end
