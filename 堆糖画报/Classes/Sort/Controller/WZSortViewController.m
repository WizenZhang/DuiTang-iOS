//
//  WZSortViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSortViewController.h"
#import "WZHttpRequestManager.h"
#import "WZSortDetailController.h"
#import "WZCategoryCell.h"
#import "WZCategory.h"
#import "WZCategoryHeadView.h"
#import "WZGroupHead.h"
#import "WaterFLayout.h"
#import "WZHeadDetailController.h"
#import "JXLDayAndNightMode.h"
@interface WZSortViewController ()<WZCategoryHeadViewDelegate,WZCategoryCellDelegate>
@property (nonatomic,strong) WZHttpRequestManager *manager;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSArray *headItems;
@end

@implementation WZSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"分类";
    self.tableView.separatorStyle=NO;
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, WZBorder, 0);
    //设置日间和夜间两种状态模式
    [self setDayAndNight];
    
    //加载数据
    [self loadData];
    
    
}
/**
 *  设置日间和夜间两种状态模式
 */
- (void)setDayAndNight
{
    [self.view jxl_setDayMode:^(UIView *view) {
        // 设置日间模式状态
        view.backgroundColor = WZDaybgColor;
    } nightMode:^(UIView *view) {
        // 设置夜间模式状态
        view.backgroundColor = WZNightbgColor;
    }];
}
- (void)loadData
{
    NSString *path = [NSString stringWithFormat:CATEGORY_URL];
    
    _manager = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = dict[@"data"];
        //获得头部数据
        NSDictionary *dic=arr[0];
        self.headItems=dic[@"group_items"];
        //数组转模型
        _dataArray = [WZCategory arrayOfModelsFromDictionaries:arr error:nil];
        
        //加载头部View
        WZCategoryHeadView *headView=[[WZCategoryHeadView alloc]init];
        headView.group_items=[WZGroupHead arrayOfModelsFromDictionaries:self.headItems error:nil];;
        headView.delegate=self;
        self.tableView.tableHeaderView=headView;
        
        [self.tableView reloadData];
        }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _dataArray.count-1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    WZCategoryCell *cell = [WZCategoryCell cellWithTableView:tableView];
    // 2.传递数据模型
    cell.category = _dataArray[indexPath.row+1];
    cell.delegate=self;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:vc animated:YES];

}
#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark - WZCategoryHeadView代理方法
- (void)headViewClickImage:(WZCategoryHeadView *)headView
{
    
    WaterFLayout *layout = [[WaterFLayout alloc]init];
    WZHeadDetailController *headDetail = [[WZHeadDetailController alloc] initWithCollectionViewLayout:layout];
    //传递ID数据模型
    headDetail.ID=headView.ID;
    headDetail.navigationItem.title=headView.name;
    [self.navigationController pushViewController:headDetail animated:YES];
}
#pragma mark - WZCategoryCell代理方法
- (void)cellOrderBtnClick:(WZCategoryCell *)categoryCell
{
    WaterFLayout *layout = [[WaterFLayout alloc]init];
    WZSortDetailController *sortDetail = [[WZSortDetailController alloc] initWithCollectionViewLayout:layout];
    //传递ID数据模型
    sortDetail.ID=categoryCell.target;
    sortDetail.navigationItem.title=categoryCell.theme;
    [self.navigationController pushViewController:sortDetail animated:YES];
}
@end
