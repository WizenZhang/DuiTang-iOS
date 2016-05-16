//
//  WZThirdRowCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZObjectLists.h"

@interface WZThirdRowCell : UITableViewCell
@property (nonatomic,strong) WZObjectLists *datas;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
