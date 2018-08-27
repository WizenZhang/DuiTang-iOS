//
//  WZMyOrderViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/27.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMyOrderViewController.h"
#import "JXLDayAndNightMode.h"
#import "WZSegmentView.h"
@interface WZMyOrderViewController ()<WZSegmentViewDelegate>
@property(nonatomic,strong)NSArray *itemsTitle;
@property(nonatomic,weak)UILabel *noContent;
@end

@implementation WZMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];
    
    _itemsTitle=@[@"全部",@"待付款",@"待发货",@"待收货",@"已完成"];
    WZSegmentView* segmentView = [[WZSegmentView alloc] initWithFrame:CGRectMake(0, 60, DeviceWidth, 60) items:_itemsTitle];
    segmentView.tintColor = [UIColor grayColor];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];

    UILabel *noContent=[[UILabel alloc]init];
    noContent.font=NameFont;
    noContent.textColor=[UIColor grayColor];
    noContent.textAlignment=NSTextAlignmentCenter;
    noContent.frame=CGRectMake(0, 300, DeviceWidth, 30);
    [self.view addSubview:noContent];
    self.noContent=noContent;
    
    [self segmentViewSelectIndex:0];
    
}
- (void)segmentViewSelectIndex:(NSInteger)index
{
    _noContent.text=[NSString stringWithFormat:@"%@还没有订单",_itemsTitle[index]] ;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
