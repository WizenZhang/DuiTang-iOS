//
//  WZSegmentView.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/28.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WZSegmentViewDelegate <NSObject>
- (void)segmentViewSelectIndex:(NSInteger)index;
@end

@interface WZSegmentView : UIView
/**
 *  设置风格颜色 默认蓝色风格
 */
@property(nonatomic ,strong) UIColor *tintColor;
@property(nonatomic) id<WZSegmentViewDelegate> delegate;

/**
 *  默认构造函数
 *
 *  @param frame frame
 *  @param items title字符串数组
 *
 *  @return 当前实例
 */
- (id)initWithFrame:(CGRect)frame items:(NSArray *)items;

@end

