//
//  WZCommentCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZCommentFrame;
@interface WZCommentCell : UITableViewCell
@property(nonatomic,strong)WZCommentFrame *cellFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
