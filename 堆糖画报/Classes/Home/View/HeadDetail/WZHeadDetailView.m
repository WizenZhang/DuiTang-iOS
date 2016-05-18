//
//  WZHeadDetailView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/18.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZHeadDetailView.h"
#import "UIImageView+WebCache.h"
#import "WZHeadDetailData.h"
#import "WZUser.h"
@interface WZHeadDetailView ()

@end
@implementation WZHeadDetailView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.frame=CGRectMake(0, 0, 375, 230);
        self.backgroundColor=[UIColor lightGrayColor];
    }
    return self;
}

- (void)setData:(WZHeadDetailData *)data
{
    _data=data;
    CGFloat ViewWidth=self.frame.size.width;
    
    //画报的名字
    UILabel *name=[[UILabel alloc]init];
    [self setupChildLabel:name text:_data.name textColor:[UIColor whiteColor]font:[UIFont boldSystemFontOfSize:20]];
    name.textAlignment=NSTextAlignmentCenter;
    name.frame=CGRectMake(0, 30,ViewWidth , 20);
    [self addSubview:name];

    //画报的总数&画报的喜欢数
    UILabel *count=[[UILabel alloc]init];
    NSString *Count=[NSString stringWithFormat:@"%d张图片  ·  %d人喜欢",_data.count,_data.like_count];
    [self setupChildLabel:count text:Count textColor:[UIColor whiteColor]font:MsgFont];
    count.textAlignment=NSTextAlignmentCenter;
    count.frame=CGRectMake(0, 60,ViewWidth , 20);
    [self addSubview:count];
    
    //分割线
    UIView *line=[[UIView alloc]init];
    line.backgroundColor=[UIColor whiteColor];
    line.frame=CGRectMake((ViewWidth-80)/2, 90, 80, 0.5);
    [self addSubview:line];
    
    //画报的用户头像
    UIImageView *avator=[[UIImageView alloc]init];
    [avator setImageWithURL:[NSURL URLWithString:_data.user.avatar]placeholderImage:[UIImage imageNamed:@"image_default"]];
    avator.clipsToBounds = YES;
    avator.layer.cornerRadius =35;
    avator.frame=CGRectMake((ViewWidth-70)/2, 110, 70, 70);
    [self addSubview:avator];
    
    //画报的用户名
    UILabel *username=[[UILabel alloc]init];
    NSString *userName=[NSString stringWithFormat:@"by %@",_data.user.username];
    [self setupChildLabel:username text: userName textColor:[UIColor whiteColor]font:userNameFont];
    username.textAlignment=NSTextAlignmentCenter;
    username.frame=CGRectMake(0, 190,ViewWidth , 20);
    [self addSubview:username];


}
- (void)setupChildLabel:(UILabel *)label text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
    label.text=text;
    label.textColor=textColor;
    label.font=font;
}
@end
