//
//  WZObjectLists.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "WZRelatedAlbums.h"
#import "WZUser.h"
#import "WZPhoto.h"
#import "WZSender.h"
#import "WZAlbum.h"


@interface WZObjectLists : JSONModel
/**
 *  画报的ID
 */
@property (nonatomic,copy) NSString *id;
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
@property (nonatomic,copy) NSString *reply_count;
/**
 *  画报的被赞数
 */
@property (nonatomic,copy) NSString *like_count;
/**
 *  画报的收藏数
 */
@property (nonatomic,copy) NSString *favorite_count;
/**
 *  画报的发布者信息（数组中装模型:WZSender)
 */
@property (nonatomic, strong) WZSender *sender;
/**
 *  画报的配图所属相册信息(数组中装模型:WZAlbum)
 */
@property (nonatomic, strong) WZAlbum *album;
/**
 *  画报的评论时间
 */
@property (nonatomic, copy) NSString *add_datetime_pretty;
/**
 *  画报的配图相关相册信息(数组中装模型:WZRelatedAlbums)
 */
@property (nonatomic,strong) NSArray< WZRelatedAlbums> *related_albums;
/**
 *  画报的用户信息(数组中装模型:WZRelatedAlbums)
 */
@property (nonatomic,strong) NSArray< WZUser> *top_like_users;

@property (nonatomic,copy) NSString *add_datetime;

@property (nonatomic,weak) NSNumber *add_datetime_ts;
@property (nonatomic,copy) NSString *icon_url;
@property (nonatomic,weak) NSNumber *sender_id;
@property (nonatomic,weak) NSNumber *like_id;




@property (nonatomic,weak) NSNumber *event_count;
@property (nonatomic,copy) NSString *extra_type;


@property (nonatomic,weak) NSNumber *buyable;
@property (nonatomic,weak) NSNumber *is_root;
@property (nonatomic,weak) NSNumber *has_favorited;




@end
