//
//  WZCellFrame.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/7.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WZObjectLists;
@interface WZCellFrame : NSObject
@property (nonatomic, strong) WZObjectLists *objectLists;

//是否双列
@property(nonatomic,assign)BOOL biserial;
//画报的顶部
@property(nonatomic ,assign, readonly) CGRect topViewF;
//画报的中部工具条
@property(nonatomic ,assign, readonly) CGRect middleToolBarF;
//画报的底部
@property(nonatomic ,assign, readonly) CGRect bottomViewF;
//画报的配图
@property(nonatomic ,assign, readonly) CGRect photoF;
//画报的配图右下角长图标志
@property(nonatomic ,assign, readonly) CGRect markF;
//画报的配图描述
@property(nonatomic ,assign, readonly) CGRect msgF;
//画报的评论图片
@property(nonatomic ,assign, readonly) CGRect replay_countPF;
//画报的评论数
@property(nonatomic ,assign, readonly) CGRect replay_countF;
//画报的被赞图片
@property(nonatomic ,assign, readonly) CGRect like_countPF;
//画报的被赞数
@property(nonatomic ,assign, readonly) CGRect like_countF;
//画报的收藏图片
@property(nonatomic ,assign, readonly) CGRect  favorite_countPF;
//画报的收藏数
@property(nonatomic ,assign, readonly) CGRect favorite_countF;
//分割线
@property(nonatomic ,assign, readonly) CGRect lineF;
//画报的发布者头像
@property(nonatomic ,assign, readonly) CGRect avatorF;
//画报的所属相册名称
@property(nonatomic ,assign, readonly) CGRect nameF;
//画报的发布者昵称
@property(nonatomic ,assign, readonly) CGRect usernameF;
/* cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellH;
/* cell的高度 */
@property (nonatomic, assign, readonly) CGFloat CellW;

/* cell的Size */
@property (nonatomic, assign, readonly) CGSize cellS;
/* cell的Frame */
@property (nonatomic, assign, readonly) CGRect cellF;

@end
