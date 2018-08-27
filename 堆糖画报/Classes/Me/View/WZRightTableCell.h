//
//  WZRightTableCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/28.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZDrawerRightModel;
@interface WZRightTableCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)WZDrawerRightModel *object_list;
@end
