//
//  WZCollectionViewCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZTopView.h"
#import "WZMiddleToolBar.h"
#import "WZBottomView.h"
#import "WZCellFrame.h"
#import "WZObjectLists.h"
#import "WZPhoto.h"
#import "WZAlbum.h"
#import "WZSender.h"
@class WZCellFrame;
@interface WZCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)WZCellFrame *cellFrame;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
