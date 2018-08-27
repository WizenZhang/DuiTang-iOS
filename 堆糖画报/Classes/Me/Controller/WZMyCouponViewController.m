//
//  WZMyCouponViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/27.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMyCouponViewController.h"
#import "JXLDayAndNightMode.h"
#import "WZSegmentView.h"
@interface WZMyCouponViewController ()<WZSegmentViewDelegate>
@property(nonatomic,strong)NSArray *itemsTitle;
@property(nonatomic,weak)UILabel *noContent;
@property (nonatomic, weak)UIButton *cover;
@property (nonatomic, weak)UIImageView *illustrate;
@end

@implementation WZMyCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];

    [self setupNavigation];
    [self setupBg];
    [self setupSegment];
    [self setupLabel];
    [self segmentViewSelectIndex:0];
}
- (void)segmentViewSelectIndex:(NSInteger)index
{
    _noContent.text=[NSString stringWithFormat:@"暂无%@优惠券",_itemsTitle[index]] ;
}
- (void)setupBg {
    UIImageView *bg=[[UIImageView alloc]init];
    [bg setImage:[UIImage imageNamed:@"coupon_ticket"]];
    bg.frame=CGRectMake(0, 64, DeviceWidth, 94);
    [self.view addSubview:bg];
}
- (void)setupLabel {
    UILabel *noContent=[[UILabel alloc]init];
    noContent.font=NameFont;
    noContent.textColor=[UIColor grayColor];
    noContent.textAlignment=NSTextAlignmentCenter;
    noContent.frame=CGRectMake(0, 300, DeviceWidth, 30);
    [self.view addSubview:noContent];
    self.noContent=noContent;

}
- (void)setupSegment {
    _itemsTitle=@[@"未使用",@"已使用",@"已过期"];
    WZSegmentView* segmentView = [[WZSegmentView alloc] initWithFrame:CGRectMake(0, 160, DeviceWidth, 60) items:_itemsTitle];
    segmentView.tintColor = [UIColor grayColor];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
}
- (void)setupNavigation {
    
    //添加说明按钮
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    [detailButton addTarget:self action:@selector(detailButton:) forControlEvents:UIControlEventTouchUpInside];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:detailButton];
;
}
- (void)detailButton:(UIButton *)button{
    //添加阴影遮盖
    UIButton *cover=[[UIButton alloc]init];
    cover.backgroundColor=[UIColor blackColor];
    cover.frame=self.view.bounds;
    cover.alpha=0.7;
    [cover addTarget:self action:@selector(removeCover) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:cover];
    self.cover=cover;
    
    //添加说明文字背景
    UIImageView *illustrate=[[UIImageView alloc]init];
    illustrate.frame=CGRectMake(15, 100, DeviceWidth-30, 450);
    [self.navigationController.view addSubview:illustrate];
    _illustrate=illustrate;

    [_illustrate jxl_setDayMode:^(UIView *view) {
        // 设置日间模式状态
        view.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        // 设置夜间模式状态
        view.backgroundColor = WZNightbgColor;
    }];
    
    //说明文字
    UILabel *title=[[UILabel alloc]init];
    title.text=@"使用优惠劵说明";
    title.font=MineFont;
    title.textColor=[UIColor blackColor];
    title.textAlignment=NSTextAlignmentLeft;
    title.frame=CGRectMake(10, 30, DeviceWidth-30, 30);
    [_illustrate addSubview:title];
    
    UITextView *detail=[[UITextView alloc]init];
    detail.text=@"1.优惠券只能折减商品总价\n\n2.优惠券一旦使用不与退回\n\n3.优惠券最终解释权归堆糖所有";
    detail.font=NameFont;
    detail.backgroundColor=[UIColor clearColor];
    detail.textColor=[UIColor grayColor];
    detail.textAlignment=NSTextAlignmentLeft;
    detail.frame=CGRectMake(10, 90, DeviceWidth-50, 300);
    [_illustrate addSubview:detail];

    UILabel *know=[[UILabel alloc]init];
    know.text=@"我知道了";
    know.font=NameFont;
    know.textColor=[UIColor cyanColor];
    know.frame=CGRectMake(200, 350, 80, 30);
    [_illustrate addSubview:know];
    

}
-(void)removeCover{

    [_cover removeFromSuperview];
    [_illustrate removeFromSuperview];
}
@end
