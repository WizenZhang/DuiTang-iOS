//
//  WZMiddleToolBar.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/7.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMiddleToolBar.h"
/**画报的工具条字体*/
#define ToolBarFont [UIFont systemFontOfSize:13]
@interface WZMiddleToolBar ()

//画报的评论图片
@property(nonatomic ,weak)UIImageView *replay_countP;
//画报的评论数
@property(nonatomic ,weak)UILabel *replay_count;
//画报的被赞图片
@property(nonatomic ,weak)UIImageView *like_countP;
//画报的被赞数
@property(nonatomic ,weak)UILabel *like_count;
//画报的收藏图片
@property(nonatomic ,weak)UIImageView  *favorite_countP;
//画报的收藏数
@property(nonatomic ,weak)UILabel *favorite_count;
//分割线
@property(nonatomic ,weak)UIView *line;

@end
@implementation WZMiddleToolBar

- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor=[UIColor blueColor];
//        self.frame=CGRectMake(0, 310,(DeviceWidth/2)-10, 40);
        
        //画报的评论图片
        
        
//        //画报的评论图片
//        self.replay_countP = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.msg.frame), 18, 18)];
//        [self.replay_countP setImage:[UIImage imageNamed:@"blog_list_icon_comments"]];
//        [self addSubview:self.replay_countP];
//        
//        //画报的评论数
//        self.replay_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.replay_countP.frame), CGRectGetMaxY(self.msg.frame), 25, 25)];
//        self.replay_count.textAlignment = NSTextAlignmentCenter;
//        self.replay_count.numberOfLines=0;
//        self.replay_count.font=ToolBarFont;
//        [self addSubview:self.replay_count];
//        
//        //画报的被赞图片
//        self.like_countP = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.replay_count.frame), CGRectGetMaxY(self.msg.frame), 18, 18)];
//        [self.like_countP setImage:[UIImage imageNamed:@"blog_list_icon_good"]];
//        [self addSubview:self.like_countP];
//        
//        //画报的被赞数
//        self.like_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.like_countP.frame), CGRectGetMaxY(self.msg.frame), 25, 25)];
//        self.like_count.textAlignment = NSTextAlignmentCenter;
//        self.like_count.numberOfLines=0;
//        self.like_count.font=ToolBarFont;
//        [self addSubview:self.like_count];
//        
//        //画报的收藏图片
//        self.favorite_countP = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.like_count.frame), CGRectGetMaxY(self.msg.frame), 18, 18)];
//        [self.favorite_countP setImage:[UIImage imageNamed:@"blog_list_icon_star"]];
//        [self addSubview:self.favorite_countP];
//        
//        //画报的收藏数
//        self.favorite_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.favorite_countP.frame), CGRectGetMaxY(self.msg.frame), 25, 25)];
//        self.favorite_count.textAlignment = NSTextAlignmentCenter;
//        self.favorite_count.numberOfLines=0;
//        self.favorite_count.font=ToolBarFont;
//        [self addSubview:self.favorite_count];
//        
//        //分割线
//        self.line=[[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.favorite_count.frame), (DeviceWidth/2)-10, 1)];
//        self.line.backgroundColor=[UIColor grayColor];
//        [self addSubview:self.line];

    }
    return self;
}


@end
