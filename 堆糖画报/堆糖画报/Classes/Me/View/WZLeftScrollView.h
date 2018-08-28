//
//  WZLeftScrollView.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZLeftScrollView;
// 声明一个协议
@protocol WZLeftScrollViewDelegate<NSObject>
@optional
- (void)LeftScrollViewClickButton:(WZLeftScrollView *)LeftScrollView;
@end
@interface WZLeftScrollView : UIView
@property(nonatomic,strong)NSArray *data_srcs;
@property(nonatomic,copy)NSString *filter;
@property (nonatomic, weak) id<WZLeftScrollViewDelegate> Delegate;

@end
