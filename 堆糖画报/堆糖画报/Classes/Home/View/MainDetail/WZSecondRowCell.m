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
#import "JXLDayAndNightMode.h"
#import "DataCenter.h"
@interface WZSecondRowCell()

//画报的被赞数
@property(nonatomic ,weak)UILabel *like_count;
//收藏
@property(nonatomic ,weak)UIButton *collection;
//收藏
@property(nonatomic ,weak)UIScrollView *scroll;
//数据库
@property(nonatomic,strong)DataCenter *dataCenter;

@end
@implementation WZSecondRowCell
-(void)setDatas:(WZObjectLists *)datas
{
    _datas=datas;
   
    if (!_datas.add_datetime_pretty) {
        return;
    }
    long like_users=_datas.top_like_users.count;
    //设置赞数
    self.like_count.text=[NSString stringWithFormat:@"赞 %lu",(unsigned long)like_users];
    
    //打开数据库
    _dataCenter = [DataCenter sharedCenter];
    BOOL ishas = [_dataCenter findDataWithModel:_datas andType:kRecordTypeWithCollection];
    
    if (ishas) {
        _collection.selected = YES;
    }else{
        _collection.selected = NO;
    }

    //添加点赞人头像
    for (long i=0; i<like_users; i++) {
        
        WZUser *users=_datas.top_like_users[i];
        //收藏者头像
        UIImageView *icon=[[UIImageView alloc]init];
        CGFloat iconWH=50;
        icon.clipsToBounds = YES;
        icon.layer.cornerRadius =25;
        icon.backgroundColor=[UIColor purpleColor];
//        NSLog(@"%@",users);
        [icon setImageWithURL:[NSURL URLWithString:users.avatar]placeholderImage:[UIImage imageNamed:@"image_default"]];
        icon.frame=CGRectMake((2*WZBorder+iconWH)*i, 0, iconWH, iconWH);
        
        //Good小手图标
        UIImageView *good=[[UIImageView alloc]init];
        [good setImage:[UIImage imageNamed:@"tag_good"]];
        good.frame=CGRectMake((2*WZBorder+iconWH)*i+30, 30, 20, 20);
        self.scroll.contentSize=CGSizeMake(((2*WZBorder+iconWH))*like_users, iconWH);
        [self.scroll addSubview:icon];
        [self.scroll addSubview:good];
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
        //取消高亮变灰
        self.selectionStyle= UITableViewCellSelectionStyleNone;
        //背景
        self.clipsToBounds = YES;
        self.layer.cornerRadius =5;

        //赞
        UILabel *like_count=[[UILabel alloc]init];
        like_count.frame=CGRectMake(15, 15, cellW, 30);
        like_count.font=[UIFont boldSystemFontOfSize:20];
        [self addSubview:like_count];
        self.like_count=like_count;
        
        //收藏
        UIButton *collection=[[UIButton alloc]init];
        [collection setImage:[UIImage imageNamed:@"ic_album_nav_collection_normal"] forState:UIControlStateNormal];
        [collection setImage:[UIImage imageNamed:@"ic_album_nav_collection_pressed"] forState:UIControlStateSelected];
        collection.frame=CGRectMake(cellW-WZBorder-50, WZBorder, 50, 50);
        [self addSubview:collection];
        self.collection=collection;

        //监听按钮点击
        [collection addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchDown];
        
        //分割线
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[UIColor grayColor];
        line.frame=CGRectMake(WZBorder, 60, cellW-2*WZBorder, 0.5);
        [self addSubview:line];
        
        //添加Scrollview
        UIScrollView *scroll=[[UIScrollView alloc]init];
        scroll.showsHorizontalScrollIndicator=NO;
        scroll.frame=CGRectMake(2*WZBorder, 75, cellW-2*WZBorder, 50);
        [self addSubview:scroll];
        self.scroll=scroll;
       
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            self.backgroundColor=[UIColor whiteColor];

        } nightMode:^(UIView *view) {
            self.backgroundColor=WZNightCellColor;

        }];

    }
    return self;
}
- (void)BtnClick:(UIButton *)button
{
    
    //判断是否有当前的应用
    
    BOOL ishas = [_dataCenter findDataWithModel:_datas andType:kRecordTypeWithCollection];
    _collection.selected = !_collection.selected;
 
    if (ishas) {
        [_dataCenter deleteDataWithModel:_datas andType:kRecordTypeWithCollection];
    }
    else{
        [_dataCenter addDataWithModel:_datas andType:kRecordTypeWithCollection];
    }
  
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
