//
//  WZSettingCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZSettingItem;

@interface WZSettingCell : UITableViewCell
@property (nonatomic, strong) WZSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
