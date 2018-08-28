//
//  WZSortHeadDetail.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  WZSortHeadDetail;
// 声明一个协议
@protocol WZSortHeadDetailDelegate <NSObject>
@optional
- (void)headViewClickButton:(WZSortHeadDetail *)headView;
@end

@class WZDetailHeadData;
@interface WZSortHeadDetail : UIImageView
@property(nonatomic,strong)WZDetailHeadData *data;
@property (nonatomic, weak) id<WZSortHeadDetailDelegate> delegate;
@property(nonatomic,copy)NSString *theme_name;
@property(nonatomic,copy)NSString *name;
/**背景毛玻璃处理图片路径*/
@property(nonatomic,copy)NSString *path;

@end
