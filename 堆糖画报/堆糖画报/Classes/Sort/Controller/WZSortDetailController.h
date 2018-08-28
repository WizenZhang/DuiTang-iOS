//
//  WZSortDetailController.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/20.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZSortDetailController : UICollectionViewController
/**传递的画报ID*/
@property(nonatomic,copy)NSString *ID;
/**背景毛玻璃处理图片路径*/
@property(nonatomic,copy)NSString *path;
@end
