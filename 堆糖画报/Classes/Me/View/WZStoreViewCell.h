//
//  WZStoreViewCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/26.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZObjectLists.h"

@interface WZStoreViewCell : UICollectionViewCell
@property(nonatomic,strong)WZObjectLists *objectLists;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
