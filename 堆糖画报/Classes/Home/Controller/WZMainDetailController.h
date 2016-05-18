//
//  WZMainDetailController.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/13.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZObjectLists;
@class WZDetailCellFrame;
@class WZUser;
@interface WZMainDetailController : UITableViewController
@property (nonatomic,strong) WZObjectLists *datas;
@property (nonatomic,strong) WZUser *users;
@property (nonatomic,strong) WZDetailCellFrame *detailCellFrame;
/**传递的画报ID*/
@property(nonatomic,strong)NSString *ID;
@end
