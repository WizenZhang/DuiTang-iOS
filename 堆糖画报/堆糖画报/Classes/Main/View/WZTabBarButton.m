//
//  WZTabBarButton.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

// 图标的比例
#define WZTabBarButtonImageRatio 0.6

// 按钮的默认文字颜色
#define  WZTabBarButtonTitleColor (iOS7 ? WZColor(80, 85, 94) : [UIColor whiteColor])
// 按钮的选中文字颜色
#define  WZTabBarButtonTitleSelectedColor (iOS7 ? WZColor(183, 0, 0) : WZColor(248, 139, 0))

#import "WZTabBarButton.h"
#import "JXLDayAndNightMode.h"
@interface WZTabBarButton()

@end

@implementation WZTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 文字颜色
        
        [self setTitleColor:WZTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        
        if (!iOS7) { // 非iOS7下,设置按钮选中时的背景
            [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            [self setTitleColor:WZTabBarButtonTitleColor forState:UIControlStateNormal];
        } nightMode:^(UIView *view) {
            [self setTitleColor:WZNightTextColor forState:UIControlStateNormal];
        }];
    }
    return self;
}

// 重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted {}

// 内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * WZTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

// 内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * WZTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

// 设置item
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个对象的属性改变了,就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
}
@end
