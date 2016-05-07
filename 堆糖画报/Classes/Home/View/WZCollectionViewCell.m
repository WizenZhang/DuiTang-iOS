//
//  WZCollectionViewCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCollectionViewCell.h"
#import "WZTopView.h"
#import "WZMiddleToolBar.h"
#import "WZBottomView.h"
#import "WZCellFrame.h"
#import "WZObjectLists.h"
#import "WZPhoto.h"
#import "WZAlbum.h"
#import "WZSender.h"




@interface WZCollectionViewCell ()
/** 画报顶部的view */
@property (nonatomic, weak) WZTopView *topView;

/** 画报中部的工具条 */
@property (nonatomic, weak) WZMiddleToolBar *middleToolBar;

/** 画报底部的view */
@property (nonatomic, weak) WZBottomView *bottomView;
@end
@implementation WZCollectionViewCell

#pragma mark - 初始化

- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
//      self.backgroundColor = [UIColor purpleColor];
       
        // 1.添加上部配图的view
        [self setupTopView];
        
        // 2.添加中部的工具条
        [self setupMiddleToolBar];
        
        // 3.添加下部的发布者View
        [self setupBottomView];    
        
    }
    return self;
}
- (void)setupTopView
{
    WZTopView *topView=[[WZTopView alloc]init];
    [self addSubview:topView];
    self.topView=topView;
    
}
- (void)setupMiddleToolBar
{
    WZMiddleToolBar *middleView=[[WZMiddleToolBar alloc]init];
    [self addSubview:middleView];
    self.middleToolBar=middleView;

}
- (void)setupBottomView
{
    WZBottomView *bottomView=[[WZBottomView alloc]init];
    [self addSubview:bottomView];
    self.bottomView=bottomView;
}
- (void)setCellFrame:(WZCellFrame *)cellFrame
{
    _cellFrame=cellFrame;
    
    // 1.topView
    self.topView.frame=self.cellFrame.topViewF;
    self.topView.cellFrame=self.cellFrame;
    
    //
    self.middleToolBar.frame=self.cellFrame.middleToolBarF;
    self.middleToolBar.cellFrame=self.cellFrame;
    //
    self.bottomView.frame=self.cellFrame.bottomViewF;
    self.bottomView.cellFrame=self.cellFrame;
}
@end
