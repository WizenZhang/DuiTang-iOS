//
//  WZClubViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/28.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZClubViewController.h"
#import "WZLeftScrollView.h"
#import "WZRightTableCell.h"
#import "AFNetworking.h"
#import "WZDrawerLeftModel.h"
#import "JSONModel.h"
#import "WZHttpRequestManager.h"
#import "MJExtension.h"
#import "WZDrawerRightModel.h"
#import "JXLDayAndNightMode.h"
#import "WZClubCommentController.h"
@interface WZClubViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,WZLeftScrollViewDelegate>
@property (nonatomic,strong) WZHttpRequestManager *manager;
/**抽屉右边TableView*/
@property (nonatomic,strong) UITableView *rightTableView;
/**抽屉左边ScrollView数据*/
@property(nonatomic,strong)NSArray *data_srcs;
/**抽屉右边TableView数据*/
@property(nonatomic,strong)NSArray *object_list;
@end

@implementation WZClubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];

    //设置导航栏
    [self setNavigation];
    
    //加载抽屉左边ScrollView数据
    [self loadLeftData];
    
    
}
/**创建抽屉右边TableView*/
- (void)setupRightTableView
{
    UITableView  *tableView = [[UITableView alloc]init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.frame=CGRectMake(DrawerW , 64, DeviceWidth-DrawerW, DeviceHeight-64);
    [self.view addSubview:tableView];
    self.rightTableView=tableView;
    
    [self.rightTableView jxl_setDayMode:^(UIView *view) {
        // 设置日间模式状态
        view.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        // 设置夜间模式状态
        view.backgroundColor = WZNightCellColor;
    }];

}


- (void)loadLeftData
{
    NSString *path = CLUBLEFT_URL;
    _manager = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *data=dict[@"data"];
        _data_srcs = [WZDrawerLeftModel objectArrayWithKeyValuesArray:data[@"data_srcs"]];

        //创建抽屉左边ScrollView
        WZLeftScrollView *leftView=[[WZLeftScrollView alloc]init];
        leftView.data_srcs=_data_srcs;
        leftView.Delegate=self;
        [self.view addSubview:leftView];
        
        //加载抽屉右边TableView数据
        WZDrawerLeftModel *datas=_data_srcs[0];
        self.filter=datas.title;
        [self loadRightData];
       
        
    }];
}
- (void)loadRightData
{
   
    //汉字转码格式
    NSString *exchangePath = [_filter stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *path = [NSString stringWithFormat:CLUB_URL,exchangePath];
    NSString *paths = [path stringByAppendingString:RIGHT_URL];

    _manager = [[WZHttpRequestManager alloc] initWithUrlString:paths andBlock:^(WZHttpRequestManager *manager) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data=dict[@"data"];
        _object_list = [WZDrawerRightModel objectArrayWithKeyValuesArray:data[@"object_list"]];
        //刷新数据

        //创建抽屉右边TableView
        [self setupRightTableView];
    }];

}
- (void)setNavigation
{
    //添加申请创建CLUB按钮
    UIButton *creatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    creatButton.frame = CGRectMake(0, 0, 110, 25);
    creatButton.titleLabel.font=UIFont(15);
    [creatButton setTitle:@"申请创建CLUB" forState:UIControlStateNormal];
    [creatButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [creatButton addTarget:self action:@selector(creatButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:creatButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _object_list.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WZRightTableCell *cell=[WZRightTableCell cellWithTableView:tableView];
    cell.object_list=_object_list[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
#pragma mark - LeftScrollView代理方法
- (void)LeftScrollViewClickButton:(WZLeftScrollView *)LeftScrollView
{
    _filter=LeftScrollView.filter;
    
    //加载抽屉右边TableView数据
    [self loadRightData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WZClubCommentController *comment=[[WZClubCommentController alloc]init];
    WZDrawerRightModel *item=_object_list[indexPath.row];
    comment.ID=item.id;
    [self.navigationController pushViewController:comment animated:YES];
}
@end
