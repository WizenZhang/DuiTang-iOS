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
    if (self.biserial) {
        CGFloat CellW = DeviceWidth-2*WZEdge;
         _CellW=CellW;
    }else{
        CGFloat CellW = (DeviceWidth-3*WZEdge)/2;
         _CellW=CellW;
    }
    
   

/******************************瀑布流尺寸**************************************/
    
    // 取出模型数据
    WZPhoto *photo=objectLists.photo;
    
    // 1.1topView
    CGFloat topViewW = _CellW;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    
    // 2.画报的配图
    CGFloat photoX = 0;
    CGFloat photoY = 0;
    CGFloat photoW = _CellW;
    CGFloat ratio = photoW / photo.width;
    CGFloat photoH = photo.height  * ratio;
    if (photoH>DeviceHeight*0.6) {
        _photoF = CGRectMake(photoX, photoY, photoW, DeviceHeight*0.6);
        CGFloat markW=30;
        CGFloat markH=18;
        CGFloat markX=CGRectGetMaxX(_photoF)-markW;
        CGFloat markY=CGRectGetMaxY(_photoF)-markH;
        _markF=CGRectMake(markX, markY,  markW, markH);
    }else{
        _photoF = CGRectMake(photoX, photoY, photoW, photoH);
        _markF=CGRectMake(0, 0,  0, 0);

    }

    //3.画报的配图描述
    CGFloat msgW = _CellW-2*WZBorder;
    CGFloat msgX = WZBorder;
    CGFloat msgY = CGRectGetMaxY(_photoF) + WZBorder;
    CGSize msgLabelSize = [objectLists.msg sizeWithFont:MsgFont constrainedToSize:CGSizeMake(msgW, 100)];
    _msgF = (CGRect){{msgX, msgY},msgLabelSize};
    
    // 1.2topView
    CGFloat topViewH = CGRectGetMaxY(_msgF);
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);

    // 4.工具条
    CGFloat middleToolBarX = 0;
    CGFloat middleToolBarY = CGRectGetMaxY(_topViewF);
    CGFloat middleToolBarW = _CellW;
    CGFloat middleToolBarH = 40;
    _middleToolBarF = CGRectMake(middleToolBarX, middleToolBarY, middleToolBarW, middleToolBarH);
    
    //5.bottomView
    CGFloat bottomViewW = _CellW;
    CGFloat bottomViewX = 0;
    CGFloat bottomViewY = CGRectGetMaxY(_middleToolBarF);
    
    //6.画报的发布者头像
    CGFloat avatorHW = 40;
    CGFloat avatorX = WZEdge;
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
    
    CGFloat bottomViewH = CGRectGetMaxY(_avatorF)+WZEdge;
    _bottomViewF = CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH);

    //9.画报的高度
    _cellH=CGRectGetMaxY(_bottomViewF);
    
//    //计算cellF左右Y值的坐标
//    static int leftColumn=0;
//    static int rightColumn=0;
//    
//    //10.画报的cellF
//    if (leftColumn>rightColumn) {
//        CGFloat positonX=(DeviceWidth-3*WZBorder)/2+2*WZBorder;
//        CGFloat positionY=rightColumn;
//        rightColumn+=_cellH+WZBorder;
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,CellW,_cellH) ;
//    }
//    else{
//        CGFloat positonX=WZBorder;
//        CGFloat positionY=leftColumn;
//        leftColumn+=_cellH+WZBorder;
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,CellW,_cellH) ;
//    }
/******************************瀑布流尺寸**************************************/
    
    
/******************************固定尺寸****************************************/

//        static int i=0;
   
//   
//    
//    // 1.1topView
//    _topViewF = CGRectMake(0, 0, CellW, 310);
//    
//    // 2.画报的配图
//    _photoF = CGRectMake(0, 0, CellW, 260);
//   
//    //3.画报的配图描述
//    _msgF = CGRectMake(0, CGRectGetMaxY(_photoF)+WZBorder, CellW, 45);
//    
//    // 4.工具条
//    _middleToolBarF = CGRectMake(0, CGRectGetMaxY(_topViewF), CellW, 40);
//    
//    //5.bottomView
//    _bottomViewF = CGRectMake(0,CGRectGetMaxY(_middleToolBarF), CellW, 50);
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
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,CellW,_cellH) ;
//    }
//    else{
//        CGFloat positonX=(DeviceWidth-3*WZBorder)/2+2*WZBorder;
//        
//        _cellF = CGRectMake(positonX, positionY+headHeight+5,CellW,_cellH) ;
//    }
//    i++;
//    NSLog(@"y=------%f", _cellF.origin.y);
   
/******************************固定尺寸****************************************/
    
}

@end
