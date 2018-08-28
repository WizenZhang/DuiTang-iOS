//
//  WZCommentFrame.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/30.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WZCommentDownModel;
@interface WZCommentFrame : NSObject
@property(nonatomic,strong)WZCommentDownModel *object_list;
/**
 *评论下部评论数目
 */
@property(nonatomic,assign, readonly) CGRect commentF;
/**
 *评论下部描述
 */
@property(nonatomic,assign, readonly) CGRect contentF;
/**
 *  评论下部的配图信息
 */
@property (nonatomic, assign, readonly) CGRect photosF;
/**
 *  评论下部发布者名称
 */
@property (nonatomic, assign, readonly) CGRect usernameF;
/**
 *  评论下部评论浏览量 
 */
@property (nonatomic, assign, readonly) CGRect visit_countF;
/* cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellH;


@end
