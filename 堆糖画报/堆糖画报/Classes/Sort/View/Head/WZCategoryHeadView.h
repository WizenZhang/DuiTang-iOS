//
//  WZCategoryHeadView.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/20.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZCategoryHeadView;
// 声明一个协议
@protocol WZCategoryHeadViewDelegate <NSObject>

@optional
- (void)headViewClickImage:(WZCategoryHeadView *)headView;

@end
@interface WZCategoryHeadView : UIView
/**传递的画报ID*/
@property(nonatomic,copy)NSString *ID;
/**传递的画报标题*/
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSArray *group_items;
@property (nonatomic, weak) id<WZCategoryHeadViewDelegate> delegate;
@end
