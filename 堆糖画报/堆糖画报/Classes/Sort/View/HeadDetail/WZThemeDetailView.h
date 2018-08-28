//
//  WZThemeDetailView.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZHeadThemeDetail;
@class WZRelatedThemeGroup;
@class WZThemeDetailView;
// 声明一个协议
@protocol WZThemeDetailViewDelegate <NSObject>

@optional
- (void)headViewClickImage:(WZThemeDetailView *)headView;

@end

@interface WZThemeDetailView : UIView
@property(nonatomic,strong)WZHeadThemeDetail *headThemeDetail;
@property(nonatomic,strong)WZRelatedThemeGroup *related_theme_group;
@property (nonatomic, weak) id<WZThemeDetailViewDelegate> delegate;
/**传递的画报ID*/
@property(nonatomic,copy)NSString *ID;
+ (instancetype)initThemeDetailView;
@end
