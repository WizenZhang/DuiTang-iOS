//
//  WZObjectLists.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WZPhoto;
@class WZAlbum;
@class WZSender;

@interface WZObjectLists : NSObject

/**
 *  画报的配图信息(数组中装模型:WZPhoto)
 */
@property (nonatomic, strong) WZPhoto *photo;
/**
 *  画报的配图描述
 */
@property (nonatomic, copy) NSString *msg;
/**
 *  画报的评论数
 */
@property (nonatomic, assign) int reply_count;
/**
 *  画报的被赞数
 */
@property (nonatomic, assign) int like_count;
/**
 *  画报的收藏数
 */
@property (nonatomic, assign) int favorite_count;
/**
 *  画报的发布者信息（数组中装模型:WZSender)
 */
@property (nonatomic, strong) WZSender *sender;
/**
 *  画报的配图所属相册信息(数组中装模型:WZAlbum)
 */
@property (nonatomic, strong) WZAlbum *album;


@end
