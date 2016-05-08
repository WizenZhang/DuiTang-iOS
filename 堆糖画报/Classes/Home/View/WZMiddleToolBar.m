//
//  WZMiddleToolBar.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/7.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMiddleToolBar.h"
#import "WZObjectLists.h"

/**画报的工具条字体*/
#define ToolBarFont [UIFont systemFontOfSize:13]
@interface WZMiddleToolBar ()

//画报的评论数
@property (nonatomic, weak) UIButton *replay_count;
//画报的被赞数
@property(nonatomic ,weak)UIButton *like_count;
//画报的收藏数
@property(nonatomic ,weak) UIButton *favorite_count;
//分割线
@property(nonatomic ,weak)UIView *line;
@end
@implementation WZMiddleToolBar

- (void)setObjectLists:(WZObjectLists *)objectLists
{
    _objectLists=objectLists;
    
    //设置数据
    [self setupBtn:self.replay_count Title:objectLists.reply_count];
    [self setupBtn:self.like_count Title:objectLists.like_count];
    [self setupBtn:self.favorite_count Title:objectLists.favorite_count];
}

- (void)setupBtn:(UIButton *)btn Title:(int)title
{
    //初始化按钮title
    NSString *str=[NSString stringWithFormat:@"%d",title];
    [btn setTitle:str forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    
   [super layoutSubviews];
    
     // 1.设置按钮的frame
    CGFloat btnW = self.frame.size.width  / self.subviews.count;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnY = 0;
    for (int i = 0; i<self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        
        // 设置frame
        CGFloat btnX = i * btnW ;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    //2.分割线
    self.line.backgroundColor=[UIColor grayColor];
    CGFloat lineY = self.frame.size.height-1;
    CGFloat lineW = self.frame.size.width;
    self.line.frame=CGRectMake(0, lineY, lineW, 1);

}

- (UIButton *)setupWithbgImage:(NSString *)bgimage
{
    //初始化按钮
    UIButton *btn=[[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:bgimage] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:btn];
    return btn;
    
}
- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        //画报的评论数按钮
        self.replay_count=[self setupWithbgImage:@"blog_list_icon_comments"];

        // 画报的被赞数按钮
        self.like_count=[self setupWithbgImage:@"blog_list_icon_good"];

        // 画报的收藏数按钮
        self.favorite_count=[self setupWithbgImage:@"blog_list_icon_star"];
        
        //分割线
        UIView *line=[[UIView alloc]init];
        [self addSubview:line];
        self.line=line;
        
     }
    return self;
}


@end
