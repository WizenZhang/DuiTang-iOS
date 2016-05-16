//
//  WZCollectionViewCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCollectionViewCell.h"


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

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{  
    static NSString *identify = @"cell";
    WZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
     return cell;
}

- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
//      self.backgroundColor = [UIColor purpleColor];
        self.clipsToBounds = YES;
        self.layer.cornerRadius =5;
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
    self.topView=topView;
    [self addSubview:self.topView];
    
    
}
- (void)setupMiddleToolBar
{
    WZMiddleToolBar *middleView=[[WZMiddleToolBar alloc]init];
    self.middleToolBar=middleView;
    [self addSubview:self.middleToolBar];
    

}
- (void)setupBottomView
{
    WZBottomView *bottomView=[[WZBottomView alloc]init];
    self.bottomView=bottomView;
    [self addSubview:self.bottomView];
    
}
- (void)setCellFrame:(WZCellFrame *)cellFrame
{
    _cellFrame=cellFrame;
//    self.backgroundColor=[UIColor redColor];

    // 1.topView
    self.topView.clipsToBounds = YES;
    self.topView.layer.cornerRadius =5;

    self.topView.frame=self.cellFrame.topViewF;
    self.topView.cellFrame=self.cellFrame;
    
    //2.middleToolBar
    self.middleToolBar.frame=self.cellFrame.middleToolBarF;
    self.middleToolBar.objectLists=self.cellFrame.objectLists;
    
    //3.bottomView
    self.bottomView.clipsToBounds = YES;
    self.bottomView.layer.cornerRadius =5;
    
    self.bottomView.frame=self.cellFrame.bottomViewF;
    self.bottomView.cellFrame=self.cellFrame;
    
}
@end
