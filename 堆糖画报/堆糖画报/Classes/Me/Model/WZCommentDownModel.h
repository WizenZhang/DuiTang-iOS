//
//  WZCommentDownModel.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/30.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
#import "WZPhoto.h"
@class WZSender;
@class WZPhoto;
@interface WZCommentDownModel : JSONModel
/**
 *  评论下部的配图信息(数组中装模型:WZPhoto)
 */
@property (nonatomic, strong)NSArray <WZPhoto> *photos;
/**
 *评论下部描述
 */
@property(nonatomic,copy)NSString *content;
/**
 *评论下部评论数目
 */
@property(nonatomic,assign)int comment_count;
/**
 *  评论下部发布者信息（数组中装模型:WZSender)
 */
@property (nonatomic, strong) WZSender *sender;
/**
 *  评论时间
 */
@property (nonatomic, copy) NSString *add_datetime_ts;
@property (nonatomic, copy) NSString *active_time;
/**
 *  评论下部评论浏览量
 */
@property (nonatomic, assign) int visit_count;
@end
