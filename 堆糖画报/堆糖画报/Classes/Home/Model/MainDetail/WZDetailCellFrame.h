//
//  WZDetailCellFrame.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZObjectLists.h"
@interface WZDetailCellFrame : NSObject
@property (nonatomic, strong) WZObjectLists *datas;

/**画报的配图*/
@property(nonatomic ,assign, readonly) CGRect photoF;
/**画报的发布者头像*/
@property(nonatomic ,assign, readonly) CGRect avatorF;
/**画报的发布者昵称*/
@property(nonatomic ,assign, readonly) CGRect usernameF;
/**画报的发布日期*/
@property(nonatomic ,assign, readonly) CGRect dateF;
/**画报的所属相册名称*/
@property(nonatomic ,assign, readonly) CGRect nameF;
/**画报的发布者详情按钮*/
@property(nonatomic ,assign, readonly) CGRect detailF;
/**分割线*/
@property(nonatomic ,assign, readonly) CGRect lineF;
/**画报的配图描述*/
@property(nonatomic ,assign, readonly) CGRect msgF;
/** cell的高度 */
@property (nonatomic, assign) CGFloat cellH;

@end
