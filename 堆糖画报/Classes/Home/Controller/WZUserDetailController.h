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
@class WZHeadDetailData;
@interface WZUserDetailController : UICollectionViewController
@property (nonatomic,strong) WZRelatedAlbums *relatedAlbums;
@property(nonatomic,strong)WZThirdRowCell *thirdRowCell;
@property (nonatomic,strong) WZObjectLists *object_list;
@property (nonatomic,strong) WZHeadDetailData *data;
/**传递的画报ID*/
@property(nonatomic,copy)NSString *ID;
/**背景毛玻璃处理图片路径*/
@property(nonatomic,copy)NSString *path;
@end
