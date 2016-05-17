//
//  WZSecondRowCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSecondRowCell.h"
#import "UIImage+MJ.h"
#import "UIImageView+WebCache.h"
@interface WZSecondRowCell()

//画报的被赞数
@property(nonatomic ,weak)UILabel *like_count;
//收藏
@property(nonatomic ,weak)UIButton *store;
//收藏
@property(nonatomic ,weak)UIScrollView *scroll;

@end
@implementation WZSecondRowCell
-(void)setDatas:(WZObjectLists *)datas
{
    _datas=datas;
    long like_users=_datas.top_like_users.count;
    //设置赞数
    self.like_count.text=[NSString stringWithFormat:@"赞 %lu",(unsigned long)like_users];
    //添加点赞人头像
    for (int i=0; i<like_users; i++) {
        
        WZUser *users=_datas.top_like_users[i];
        //收藏者头像
        UIImageView *icon=[[UIImageView alloc]init];
        CGFloat iconWH=50;
        icon.clipsToBounds = YES;
        icon.layer.cornerRadius =3;
        icon.backgroundColor=[UIColor purpleColor];
        [icon setImageWithURL:[NSURL URLWithString:users.avatar]placeholderImage:[UIImage imageNamed:@"image_default"]];
        icon.frame=CGRectMake((2*WZBorder+iconWH)*i, 0, iconWH, iconWH);
        self.scroll.contentSize=CGSizeMake(((2*WZBorder+iconWH))*like_users, iconWH);
        [self.scroll addSubview:icon];
    }
}
#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"secondRow";
    WZSecondRowCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WZSecondRowCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.backgroundColor=[UIColor yellowColor];
        CGFloat cellW = DeviceWidth-2*WZBorder;
        //背景
        self.clipsToBounds = YES;
        self.layer.cornerRadius =5;
        UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth-2*WZBorder, 140)];
        [image setImage:[UIImage resizedImageWithName:@"bar_base_middle"]];
        [self addSubview:image];
        //赞
        UILabel *like_count=[[UILabel alloc]init];
        like_count.frame=CGRectMake(15, 15, cellW, 30);
        like_count.font=[UIFont boldSystemFontOfSize:20];
        [self addSubview:like_count];
        self.like_count=like_count;
        
        //收藏
        UIButton *store=[[UIButton alloc]init];
        [store setImage:[UIImage imageNamed:@"ic_album_nav_collection_normal"] forState:UIControlStateNormal];
        [store setImage:[UIImage imageNamed:@"ic_album_nav_collection_pressed"] forState:UIControlStateHighlighted];
        store.frame=CGRectMake(cellW-WZBorder-50, WZBorder, 50, 50);
        [self addSubview:store];
        self.store=store;
        
        //分割线
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[UIColor grayColor];
        line.frame=CGRectMake(WZBorder, 60, cellW-2*WZBorder, 0.5);
        [self addSubview:line];
        
        //添加Scrollview
        UIScrollView *scroll=[[UIScrollView alloc]init];
        scroll.frame=CGRectMake(2*WZBorder, 75, cellW-2*WZBorder, 50);
        [self addSubview:scroll];
        self.scroll=scroll;
       
    }
    return self;
}
/**
 *  拦截frame的设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += WZBorder;
    frame.origin.x = WZBorder;
    frame.size.width -= 2* WZBorder;
    frame.size.height -= WZBorder;
    [super setFrame:frame];
}


@end
