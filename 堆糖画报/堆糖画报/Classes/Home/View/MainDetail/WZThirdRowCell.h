//
//  WZThirdRowCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZObjectLists.h"
@class WZThirdRowCell;
@class WZRelatedAlbums;

//声明一个协议
@protocol WZThirdRowCellDelegate <NSObject>
@optional
- (void)thirdRowCellClickImage:(WZThirdRowCell *)thirdRowCell;
@end

@interface WZThirdRowCell : UITableViewCell
@property(nonatomic ,weak)id <WZThirdRowCellDelegate>delegate;

@property (nonatomic,strong) WZObjectLists *datas;
@property(nonatomic,strong)WZRelatedAlbums *WZRelatedAlbums;
/**点击的图片索引*/
@property(nonatomic,assign)long imageIndex;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
