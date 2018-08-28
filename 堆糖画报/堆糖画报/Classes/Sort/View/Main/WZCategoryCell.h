//
//  WZCategoryCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/19.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZCategory;
@class WZCategoryCell;
//声明一个协议
@protocol WZCategoryCellDelegate <NSObject>

@optional
-(void)cellOrderBtnClick:(WZCategoryCell *)categoryCell;

@end
@interface WZCategoryCell : UITableViewCell
@property(nonatomic,strong)WZCategory *category;
/** 存储按钮点击后跳转的目标ID */
@property(nonatomic,copy)NSString *target;
/** 存储按钮点击后跳转的目标控制器标题 */
@property(nonatomic,copy)NSString *theme;
@property (nonatomic, weak) id <WZCategoryCellDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
