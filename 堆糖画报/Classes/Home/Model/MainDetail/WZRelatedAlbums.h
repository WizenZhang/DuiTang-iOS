//
//  WZRelatedAlbums.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"

@class WZUser;
@protocol WZRelatedAlbums

@end
@interface WZRelatedAlbums : JSONModel

/**
 * 收藏以下专辑个数
 */
@property(nonatomic ,copy) NSString *like_count;
/**
 *  相关画报的相册配图
 */
@property (nonatomic,strong) NSArray *covers;
/**
 *  相关画报的相册ID
 */
@property (nonatomic,copy) NSString *id;
/**
 *  相关画报的相册名称
 */
@property (nonatomic,copy) NSString *name;
/**
 *  相关画报的相册用户(数组中装模型:WZUser)
 */
@property (nonatomic,strong) WZUser *user;
@end
