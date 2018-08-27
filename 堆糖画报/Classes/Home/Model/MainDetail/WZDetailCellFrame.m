//
//  WZDetailCellFrame.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZDetailCellFrame.h"
#import "WZObjectLists.h"
#import "WZPhoto.h"
#import "WZAlbum.h"
#import "WZSender.h"

@implementation WZDetailCellFrame

- (void)setDatas:(WZObjectLists *)datas
{
    _datas=datas;
    
    // 取出模型数据
    WZAlbum *album=datas.album;
    WZPhoto *photo=datas.photo;
    WZSender *sender=datas.sender;
    // 1.画报的配图
    CGFloat photoX = 0;
    CGFloat photoY = 0;
    CGFloat photoW = cellW;
    CGFloat ratio = photoW / photo.width ;
    CGFloat photoH = photo.height  * ratio;
    _photoF = CGRectMake(photoX, photoY, photoW, photoH);
    
    // 2.画报的发布者头像
    CGFloat avatorHW = 40;
    CGFloat avatorX = WZBorder;
    CGFloat avatorY = CGRectGetMaxY(_photoF) + 2*WZBorder;
    _avatorF = CGRectMake(avatorX, avatorY, avatorHW, avatorHW);

    // 3.画报的发布者昵称
    CGFloat usernameX = CGRectGetMaxX(_avatorF)+ 2*WZBorder;
    CGFloat usernameY = CGRectGetMaxY(_photoF) + 2*WZBorder;
    NSString *username=[NSString stringWithFormat:@"by：%@",sender.username];
    CGSize usernameLabelSize = [username sizeWithFont:NameFont constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    _usernameF = (CGRect){{usernameX, usernameY},usernameLabelSize};
    
    // 4.画报的发布日期
    CGFloat dateW = 70;
    CGFloat dateH = 16;
    CGFloat dateX = CGRectGetMaxX(_usernameF);
    CGFloat dateY = CGRectGetMaxY(_photoF) + 2*WZBorder+2;
    _dateF = CGRectMake(dateX, dateY, dateW, dateH);

    // 5.画报的所属相册名称
    CGFloat nameX = CGRectGetMaxX(_avatorF)+ 2*WZBorder;
    CGFloat nameY = CGRectGetMaxY(_usernameF) + WZBorder;
    NSString *name=[NSString stringWithFormat:@"收集到 %@",album.name];
    CGSize nameLabelSize = [name sizeWithFont:MsgFont constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    _nameF = (CGRect){{nameX, nameY},nameLabelSize};
    
    // 6.画报的详情按钮
    CGFloat detailHW = 30;
    CGFloat detailX =cellW-2*WZBorder-30;
    CGFloat detailY = CGRectGetMaxY(_photoF) + 2*WZBorder;
    _detailF = CGRectMake(detailX, detailY, detailHW, detailHW);
    
    // 7.分割线
    CGFloat lineX = WZBorder;
    CGFloat lineY = CGRectGetMaxY(_avatorF)+ 2*WZBorder;
    CGFloat lineW = cellW - 2*WZBorder;
    CGFloat lineH = 0.5;
    _lineF = CGRectMake(lineX, lineY, lineW, lineH);

    // 8.画报的配图描述
    CGFloat msgW = cellW-2*WZBorder;
    CGFloat msgX = WZBorder;
    CGFloat msgY = CGRectGetMaxY(_lineF) + 2*WZBorder;
    NSString *msg=[NSString stringWithFormat:@"简介：%@",_datas.msg];
    CGSize msgLabelSize = [msg sizeWithFont:MsgFont constrainedToSize:CGSizeMake(msgW, MAXFLOAT)];
    _msgF = (CGRect){{msgX, msgY},msgLabelSize};
    
     // 9.画报的高度
    _cellH=CGRectGetMaxY(_msgF)+3*WZBorder;

}
@end
