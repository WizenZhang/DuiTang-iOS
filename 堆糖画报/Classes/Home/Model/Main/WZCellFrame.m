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

@implementation WZCellFrame
- (void)setObjectLists:(WZObjectLists *)objectLists
{

    _objectLists=objectLists;

    CGFloat cellW = (DeviceWidth-4*WZBorder)/2;

/******************************瀑布流尺寸**************************************/
    
    // 取出模型数据
    WZPhoto *photo=objectLists.photo;
    
    // 1.1topView
    CGFloat topViewW = cellW;
    CGFloat topViewX = WZBorder;
    CGFloat topViewY = 0;
    
    // 2.画报的配图
    CGFloat photoX = 0;
    CGFloat photoY = 0;
    CGFloat photoW = cellW;
    CGFloat ratio = photoW / photo.width;
    CGFloat photoH = photo.height * ratio;
    if (photoH>DeviceHeight*0.6) {
        _photoF = CGRectMake(photoX, photoY, photoW, DeviceHeight*0.6);

    }else{
        _photoF = CGRectMake(photoX, photoY, photoW, photoH);
    }

    
    //3.画报的配图描述
    CGFloat msgW = cellW-2*WZBorder;
    CGFloat msgX = WZBorder;
    CGFloat msgY = CGRectGetMaxY(_photoF) + WZBorder;
    CGSize msgLabelSize = [objectLists.msg sizeWithFont:MsgFont constrainedToSize:CGSizeMake(msgW, 100)];
    _msgF = (CGRect){{msgX, msgY},msgLabelSize};
    
    // 1.2topView
    CGFloat topViewH = CGRectGetMaxY(_msgF);
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH+5);

    // 4.工具条
    CGFloat middleToolBarX = WZBorder;
    CGFloat middleToolBarY = CGRectGetMaxY(_topViewF)-5;
    CGFloat middleToolBarW = cellW;
    CGFloat middleToolBarH = 40;
    _middleToolBarF = CGRectMake(middleToolBarX, middleToolBarY, middleToolBarW, middleToolBarH+5);
    
    //5.bottomView
    CGFloat bottomViewW = cellW;
    CGFloat bottomViewH = 50;
    CGFloat bottomViewX = WZBorder;
    CGFloat bottomViewY = CGRectGetMaxY(_middleToolBarF)-4;
    _bottomViewF = CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH);

    //6.画报的发布者头像
    CGFloat avatorHW = 40;
    CGFloat avatorX = WZBorder;
    CGFloat avatorY = WZBorder;
    _avatorF = CGRectMake(avatorX, avatorY, avatorHW, avatorHW);
    
    //7.画报的所属相册名称
    CGFloat nameW = 100;
    CGFloat nameH = 16;
    CGFloat nameX =CGRectGetMaxX(_avatorF)+ WZBorder;
    CGFloat nameY =  WZBorder;
    _nameF = CGRectMake(nameX, nameY, nameW, nameH);
    
    //8.画报的发布者昵称
    CGFloat usernameW = 100;
    CGFloat usernameH = 16;
    CGFloat usernameX = CGRectGetMaxX(_avatorF)+ WZBorder;;
    CGFloat usernameY = CGRectGetMaxY(_nameF) + WZBorder;
    _usernameF = CGRectMake(usernameX, usernameY, usernameW, usernameH);
    
    //9.画报的高度
    _cellH=CGRectGetMaxY(_bottomViewF)+WZBorder;
    
//    //计算cellF左右Y值的坐标
//    static int leftColumn=0;
//    static int rightColumn=0;
//    
//    //10.画报的cellF
//    if (leftColumn>rightColumn) {
//        CGFloat positonX=(DeviceWidth-3*WZBorder)/2+2*WZBorder;
//        CGFloat positionY=rightColumn;
//        rightColumn+=_cellH+WZBorder;
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,cellW,_cellH) ;
//    }
//    else{
//        CGFloat positonX=WZBorder;
//        CGFloat positionY=leftColumn;
//        leftColumn+=_cellH+WZBorder;
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,cellW,_cellH) ;
//    }
/******************************瀑布流尺寸**************************************/
    
    
/******************************固定尺寸****************************************/

//        static int i=0;
   
//   
//    
//    // 1.1topView
//    _topViewF = CGRectMake(0, 0, cellW, 310);
//    
//    // 2.画报的配图
//    _photoF = CGRectMake(0, 0, cellW, 260);
//   
//    //3.画报的配图描述
//    _msgF = CGRectMake(0, CGRectGetMaxY(_photoF)+WZBorder, cellW, 45);
//    
//    // 4.工具条
//    _middleToolBarF = CGRectMake(0, CGRectGetMaxY(_topViewF), cellW, 40);
//    
//    //5.bottomView
//    _bottomViewF = CGRectMake(0,CGRectGetMaxY(_middleToolBarF), cellW, 50);
//    
//    //6.画报的发布者头像
//    _avatorF = CGRectMake(WZBorder, WZBorder, 40, 40);
//    
//    //7.画报的所属相册名称
//    _nameF = CGRectMake(50, WZBorder, 87, 16);
//    
//    //8.画报的发布者昵称
//    _usernameF = CGRectMake(50, CGRectGetMaxY(_nameF)+WZBorder, 87, 16);
// 
//    //9.画报的高度
//    _cellH=405;
//***************************************************************
//    CGFloat positionY=_cellH*(i/2);
//    //10.画报的cellF
//    if (i % 2==0) {
//        CGFloat positonX=WZBorder;
//        
//        
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,cellW,_cellH) ;
//    }
//    else{
//        CGFloat positonX=(DeviceWidth-3*WZBorder)/2+2*WZBorder;
//        
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,cellW,_cellH) ;
//    }
//    i++;
//    NSLog(@"y=------%f", _cellF.origin.y);
   
/******************************固定尺寸****************************************/
    
}

@end
