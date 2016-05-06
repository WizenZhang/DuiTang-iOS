//
//  WZCollectionViewCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCollectionViewCell.h"

@implementation WZCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
//      self.backgroundColor = [UIColor purpleColor];
        
        //画报的配图
        self.photo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (DeviceWidth/2)-10, 260)];
        self.photo.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.photo];
        
        //画报的配图描述
        self.msg = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.photo.frame), CGRectGetWidth(self.frame)-10, 45)];
//        self.msg.textAlignment = NSTextAlignmentCenter;
        self.msg.numberOfLines=0;
        [self addSubview:self.msg];
        
        //画报的评论图片
        self.replay_countP = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.msg.frame), 18, 18)];
        [self.replay_countP setImage:[UIImage imageNamed:@"blog_list_icon_comments"]];
        [self addSubview:self.replay_countP];
       
        //画报的评论数
        self.replay_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.replay_countP.frame), CGRectGetMaxY(self.msg.frame), 25, 25)];
        self.replay_count.textAlignment = NSTextAlignmentCenter;
        self.replay_count.numberOfLines=0;
        [self addSubview:self.replay_count];
        
        //画报的被赞图片
        self.like_countP = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.replay_count.frame), CGRectGetMaxY(self.msg.frame), 18, 18)];
        [self.like_countP setImage:[UIImage imageNamed:@"blog_list_icon_good"]];
        [self addSubview:self.like_countP];

        //画报的被赞数
        self.like_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.like_countP.frame), CGRectGetMaxY(self.msg.frame), 25, 25)];
        self.like_count.textAlignment = NSTextAlignmentCenter;
        self.like_count.numberOfLines=0;
        [self addSubview:self.like_count];
        
        //画报的收藏图片
        self.favorite_countP = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.like_count.frame), CGRectGetMaxY(self.msg.frame), 18, 18)];
        [self.favorite_countP setImage:[UIImage imageNamed:@"blog_list_icon_star"]];
        [self addSubview:self.favorite_countP];

        //画报的收藏数
        self.favorite_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.favorite_countP.frame), CGRectGetMaxY(self.msg.frame), 25, 25)];
        self.favorite_count.textAlignment = NSTextAlignmentCenter;
        self.favorite_count.numberOfLines=0;
        [self addSubview:self.favorite_count];
        
        //分割线
        self.line=[[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.favorite_count.frame), (DeviceWidth/2)-10, 1)];
        self.line.backgroundColor=[UIColor grayColor];
        [self addSubview:self.line];
        
        //画报的发布者头像
        self.avator = [[UIImageView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.line.frame)+5, 40, 40)];
        self.avator.backgroundColor=[UIColor blueColor];
        [self addSubview:self.avator];
        
        //画报的所属相册名称
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.avator.frame)+5, CGRectGetMaxY(self.line.frame)+5, 87, 16)];
        [self addSubview:self.name];
        
        //画报的发布者昵称
        self.username = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.avator.frame)+5, CGRectGetMaxY(self.name.frame)+5, 87, 16)];
        [self addSubview:self.username];
    }
    return self;
}

@end
