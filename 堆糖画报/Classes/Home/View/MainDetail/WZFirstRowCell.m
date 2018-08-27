//
//  WZFirstRowCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZFirstRowCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+MJ.h"
#import "WZDetailCellFrame.h"
#import "WZPhoto.h"
#import "WZSender.h"
#import "WZAlbum.h"
#import "JXLDayAndNightMode.h"
@interface WZFirstRowCell()
/**画报的配图*/
@property(nonatomic ,weak)UIImageView *photo;
/**画报的发布者头像*/
@property(nonatomic ,weak)UIImageView *avator;
/**画报的发布者昵称*/
@property(nonatomic ,weak)UILabel *username;
/**画报的所属相册名称*/
@property(nonatomic ,weak)UILabel *name;
/**画报的发布日期*/
@property(nonatomic ,weak)UILabel *date;
/**画报的发布者详情按钮*/
@property(nonatomic ,weak)UIImageView *detail;
/**分割线*/
@property(nonatomic ,weak)UIView *line;
/**画报的配图描述*/
@property(nonatomic ,weak)UILabel *msg;

@end
@implementation WZFirstRowCell

-(void)setDatas:(WZObjectLists *)datas
{
    _datas=datas;
    if (!_datas) {
        return;
    }
    // 取出模型数据
    WZPhoto *photo=_datas.photo;
    WZSender *sender=_datas.sender;
    WZAlbum *album=_datas.album;
    
    // 0.传递Frame模型
    self.detailCellFrame=[[WZDetailCellFrame alloc]init];
    _detailCellFrame.datas=_datas;
   
    // 1.画报的配图
    
    [self.photo setImageWithURL:[NSURL URLWithString:photo.path]placeholderImage:[UIImage imageNamed:@"image_default"]];
    self.photo.frame=_detailCellFrame.photoF;
    
    // 2.画报的发布者头像
    [self.avator setImageWithURL:[NSURL URLWithString:sender.avatar]placeholderImage:[UIImage imageNamed:@"image_default"]];
    self.avator.clipsToBounds = YES;
    self.avator.layer.cornerRadius =20;
    self.avator.frame=_detailCellFrame.avatorF;
    
    // 3.画报的发布者昵称
    self.username.text=[NSString stringWithFormat:@"by:%@",sender.username];
    self.username.frame=_detailCellFrame.usernameF;
    
    // 4.画报的发布日期
    self.date.text=[NSString stringWithFormat:@"· %@",datas.add_datetime_pretty];
    self.date.frame=_detailCellFrame.dateF;
    
    // 5.画报的所属相册名称
    self.name.text=[NSString stringWithFormat:@"收集到 %@",album.name];
    self.name.frame=_detailCellFrame.nameF;
    
    // 6.画报的详情按钮
    self.detail.frame=_detailCellFrame.detailF;
    
    // 7.分割线
    self.line.frame=_detailCellFrame.lineF;
    
    // 8.画报的配图描述
    self.msg.text=[NSString stringWithFormat:@"简介：%@",datas.msg];
    self.msg.frame=_detailCellFrame.msgF;
    
    
}

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"firstRow";
    WZFirstRowCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WZFirstRowCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //取消高亮变灰
        self.selectionStyle= UITableViewCellSelectionStyleNone;
        self.clipsToBounds = YES;
        self.layer.cornerRadius =5;

        // 画报的配图
        UIImageView *photo=[[UIImageView alloc]init];
        [self addSubview:photo];
        self.photo=photo;
        
        //画报的发布者头像
        UIImageView *avator=[[UIImageView alloc]init];
        [self addSubview:avator];
        self.avator=avator;
        
        //画报的发布者昵称
        UILabel *username=[[UILabel alloc]init];
        username.font = NameFont;
        username.textColor=[UIColor grayColor];
        [username setTextColor:[UIColor blueColor]];
        [self addSubview:username];
        self.username=username;
        
        //画报的所属相册名称
        UILabel *name=[[UILabel alloc]init];
        name.font = MsgFont;
        [self addSubview:name];
        self.name=name;
        
        //画报的发布日期
        UILabel *date=[[UILabel alloc]init];
        date.font = DateFont;
        [date setTextColor:[UIColor grayColor]];
        [self addSubview:date];
        self.date=date;
        
        //画报的发布者详情
        UIImageView *detail=[[UIImageView alloc]init];
        [detail setImage:[UIImage imageNamed:@"detail"]];
        [self addSubview:detail];
        self.detail=detail;
        
        //分割线
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[UIColor grayColor];
        [self addSubview:line];
        self.line=line;
        
        //画报的配图描述
        UILabel *msg=[[UILabel alloc]init];
        msg.font = MsgFont;
        msg.numberOfLines=0;
        [self addSubview:msg];
        self.msg=msg;
        
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            self.backgroundColor=[UIColor whiteColor];
            [self.name setTextColor:[UIColor blackColor]];
            [self.msg setTextColor:[UIColor blackColor]];
        } nightMode:^(UIView *view) {
            self.backgroundColor=WZNightCellColor;
            [self.name setTextColor:WZNightTextColor];
            [self.msg setTextColor:WZNightTextColor];
        }];
        
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
    frame.size.width -= 2 * WZBorder;
    frame.size.height -= WZBorder;
    [super setFrame:frame];
}


@end
