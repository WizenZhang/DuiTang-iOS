//
//  WZLeftScrollView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZLeftScrollView.h"
#import "WZDrawerLeftModel.h"
#import "JXLDayAndNightMode.h"
@interface WZLeftScrollView ()
@end
@implementation WZLeftScrollView
{
    NSMutableArray *titleButtonFrame;
    UIView *titleTagView;
    UIButton *currentButton;
    UIView *divisionLineView;
}

- (void)setData_srcs:(NSArray *)data_srcs
{
    _data_srcs=data_srcs;
    
    //设置抽屉选项
    [self titleScrollViewAddButton:_data_srcs];
}
- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        //设置抽屉容器
        [self setupscrollView];
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            self.backgroundColor=[UIColor whiteColor];
        } nightMode:^(UIView *view) {
            self.backgroundColor=WZNightCellColor;
        }];

    }
    return self;
}

- (void)setupscrollView
{
    self.frame=CGRectMake(0, 64,DrawerW, DeviceHeight-64);
    
    [self addTitleScrollViewTagView];
    [self addSubview:titleTagView];
    [self addSubview:divisionLineView];
}

- (void)addTitleScrollViewTagView
{
    titleTagView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, 4, 44)];
    titleTagView.backgroundColor = WZColor(183, 0, 0);
    divisionLineView= [[UIView alloc]initWithFrame:CGRectMake(DrawerW-1, 0, 1, DeviceHeight)];
    divisionLineView.backgroundColor = [UIColor grayColor];
}
- (void)titleScrollViewAddButton:(NSArray *)data
{
    titleButtonFrame = [NSMutableArray array];
    CGFloat space = 0;
    CGFloat titleButtonY = 10;
    
    for (int i = 0; i < data.count; i++) {
        WZDrawerLeftModel *datas=_data_srcs[i];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  
        button.frame = CGRectMake(10, titleButtonY , 90,44);
        [button setTitle:datas.title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [button setTitleColor:WZColor(183, 0, 0) forState:UIControlStateSelected];
        button.titleLabel.font = UIFont(16);
        titleButtonY += 44+space;
        [self addSubview:button];
        [titleButtonFrame addObject:button];
        button.tag = i;
        [button addTarget:self action:@selector(checkTitleButtonSelectorScrollPage:) forControlEvents:UIControlEventTouchUpInside];
        //第一次进入时选中第0个
        if (button.tag==0) {
             [self checkTitleButtonSelectorScrollPage:button];
        }
      }
}
- (void)checkTitleButtonSelectorScrollPage:(UIButton*)button
{
    currentButton.selected = NO;
    button.selected = YES;
    currentButton = button;
    
    int page = (int)button.tag;
    self.filter=button.titleLabel.text;
    //通知代理
    if ([self.Delegate respondsToSelector:@selector(LeftScrollViewClickButton:)]) {
        [self.Delegate LeftScrollViewClickButton:self];
    }
    [self didSelectPage:page];

}
- (void)didSelectPage:(int)page
{
    switch (page) {
        case 0: titleTagView.frame = [self titleTagViewFrameTag:0]; break;
        case 1: titleTagView.frame = [self titleTagViewFrameTag:1]; break;
        case 2: titleTagView.frame = [self titleTagViewFrameTag:2]; break;
        case 3: titleTagView.frame = [self titleTagViewFrameTag:3]; break;
        case 4: titleTagView.frame = [self titleTagViewFrameTag:4]; break;
        case 5: titleTagView.frame = [self titleTagViewFrameTag:5]; break;
        case 6: titleTagView.frame = [self titleTagViewFrameTag:6]; break;
 
        default:
            break;
    }
}
- (CGRect)titleTagViewFrameTag:(int)tag
{
    UIButton *button = titleButtonFrame[tag];
    CGRect rect = button.frame;
    return CGRectMake(0, rect.origin.y, 4,button.bounds.size.height );
}


@end
