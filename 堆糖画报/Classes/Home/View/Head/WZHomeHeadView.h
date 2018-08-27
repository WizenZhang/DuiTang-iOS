//
//  WZHomeHeadView.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/4.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZHomeHeadView;
//声明一个协议
@protocol WZHomeHeadViewDelegate <NSObject>
@optional
- (void)homeHeadViewClickImage:(WZHomeHeadView *)homeHeadView;
- (void)homeHeadViewClickSingle:(WZHomeHeadView *)homeHeadView;
- (void)homeHeadViewClickBiserial:(WZHomeHeadView *)homeHeadView;
@end

@interface WZHomeHeadView : UIView
@property(nonatomic ,weak)id <WZHomeHeadViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIButton *biserialButton;
@property (weak, nonatomic) IBOutlet UIButton *singleButton;
/**要跳转的画报ID*/
@property(nonatomic,strong)NSString *ID;
+ (instancetype)headerView;


@end
