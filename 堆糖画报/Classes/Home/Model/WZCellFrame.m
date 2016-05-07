//
//  WZCellFrame.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/7.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCellFrame.h"
#import "WZObjectLists.h"
#import "WZPhoto.h"
#import "WZAlbum.h"
#import "WZSender.h"
/** 边框宽度 */
#define WZBorder 5
@implementation WZCellFrame
- (void)setObjectLists:(WZObjectLists *)objectLists
{
    _objectLists=objectLists;
    
    // cell的宽度
    CGFloat cellW = (DeviceWidth/2)-10;
    
    
    // 1.topView
    CGFloat topViewW = cellW;
    CGFloat topViewH = 400;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    // 2.画报的配图
    CGFloat photoW = cellW;
    CGFloat photoH = 260;
    CGFloat photoX = 0;
    CGFloat photoY = 0;
    _photoF = CGRectMake(photoX, photoY, photoW, photoH);
    
    //3.画报的配图描述
    CGFloat msgW = cellW;
    CGFloat msgH = 45;
    CGFloat msgX = 0;
    CGFloat msgY = CGRectGetMaxY(_photoF) + WZBorder;
    _msgF = CGRectMake(msgX, msgY, msgW, msgH);

    // 4.工具条
    CGFloat middleToolBarX = 0;
    CGFloat middleToolBarY = CGRectGetMaxY(_msgF) + WZBorder;
    CGFloat middleToolBarW = cellW;
    CGFloat middleToolBarH = 40;
    _middleToolBarF = CGRectMake(middleToolBarX, middleToolBarY, middleToolBarW, middleToolBarH);
    
    //5.bottomView
    CGFloat bottomViewW = cellW;
    CGFloat bottomViewH = 50;
    CGFloat bottomViewX = 0;
    CGFloat bottomViewY = CGRectGetMaxY(_middleToolBarF) + WZBorder;
    _bottomViewF = CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH);

    //6.画报的发布者头像
    CGFloat avatorHW = 40;
    CGFloat avatorX = WZBorder;
    CGFloat avatorY = WZBorder;
    _avatorF = CGRectMake(avatorX, avatorY, avatorHW, avatorHW);
    
    //7.画报的所属相册名称
    CGFloat nameW = 87;
    CGFloat nameH = 16;
    CGFloat nameX =CGRectGetMaxX(_avatorF)+ WZBorder;
    CGFloat nameY =  WZBorder;
    _nameF = CGRectMake(nameX, nameY, nameW, nameH);
    
    //8.画报的发布者昵称
    CGFloat usernameW = 87;
    CGFloat usernameH = 16;
    CGFloat usernameX = CGRectGetMaxX(_avatorF)+ WZBorder;;
    CGFloat usernameY = CGRectGetMaxY(_nameF) + WZBorder;
    _usernameF = CGRectMake(usernameX, usernameY, usernameW, usernameH);
    
}
@end
