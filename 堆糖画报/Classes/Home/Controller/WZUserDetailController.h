//
//  WZUserDetailController.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/16.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZThirdRowCell.h"
@class WZRelatedAlbums;
@class WZObjectLists;

@interface WZUserDetailController : UICollectionViewController
@property (nonatomic,strong) WZRelatedAlbums *relatedAlbums;
@property(nonatomic,strong)WZThirdRowCell *thirdRowCell;
@property (nonatomic,strong) WZObjectLists *object_list;

@end
