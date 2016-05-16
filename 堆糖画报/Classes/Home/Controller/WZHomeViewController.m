//
//  WZCollectionViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/12.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZHomeViewController.h"
#import "WaterFallHeader.h"
#import "WaterFallFooter.h"
#import "WaterFLayout.h"
#import "WZHomeHeadData.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"
#import "WZHomeHeadData.h"
#import "WZObjectLists.h"
#import "WZPhoto.h"
#import "WZAlbum.h"
#import "WZSender.h"
#import "MBProgressHUD+MJ.h"
#import "WZCellFrame.h"
#import "WZCollectionViewCell.h"
#import "MJRefresh.h"
#import "MBProgressHUD+MJ.h"
#import "WZHomeHeadView.h"
#import "WZMainDetailController.h"

@interface WZHomeViewController () <MJRefreshBaseViewDelegate>
@property(nonatomic,strong)NSMutableArray *cellFrame;
@property(nonatomic,strong)NSMutableArray *datasArray;
@property (nonatomic, strong) WZCollectionViewCell *cell;
@property (nonatomic, weak) MJRefreshFooterView *footer;
@property (nonatomic, weak) MJRefreshHeaderView *header;
@end

@implementation WZHomeViewController
- (NSMutableArray *)statusFrames
{
    if (_cellFrame == nil) {
        _cellFrame = [NSMutableArray array];
    }
    return _cellFrame;
}
- (id)init
{
    WaterFLayout *flowLayout = [[WaterFLayout alloc]init];
    //设置cell之间的垂直距离
    flowLayout.minimumInteritemSpacing=WZBorder;
    //设置cell之间的水平距离
    flowLayout.minimumColumnSpacing=WZBorder;
    self = [super initWithCollectionViewLayout:flowLayout];
    if (self)
    {
        
        self.collectionView.backgroundColor=WZColor(223, 224, 225);
        self.collectionView.frame=CGRectMake(0, 0, DeviceWidth, DeviceHeight);
        [self.collectionView registerClass:[WZCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.collectionView registerClass:[WaterFallHeader class]  forSupplementaryViewOfKind:WaterFallSectionHeader withReuseIdentifier:@"WaterFallSectionHeader"];
    }
    return self;
}
/**头部显示的内容**/
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView =[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"WaterFallSectionHeader"forIndexPath:indexPath];
    return reusableView;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    return headHeight+WZBorder;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0.集成刷新控件
    [self setupRefreshView];
}
/**
 *  集成刷新控件
 */
- (void)setupRefreshView
{
    //1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.collectionView;
    header.delegate = self;
    // 自动进入刷新状态
    [header beginRefreshing];
    self.header = header;
    
    // 2.上拉刷新(上拉加载更多数据)
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = self.collectionView;
    footer.delegate = self;
    self.footer = footer;
}
/**
 *  刷新控件进入开始刷新状态的时候调用
 */
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) { // 上拉刷新
        [self loadMoreData];
    } else { // 下拉刷新
        [self loadNewData];
    }
}
/**
 *  发送请求加载更多的画报数据
 */
- (void)loadMoreData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [mgr GET:MAIN_URL parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
         NSDictionary *data=responseObject[@"data"];
         NSArray *statusArray=[WZObjectLists objectArrayWithKeyValuesArray:data[@"object_list"]];
         
         // 创建frame模型对象
         NSMutableArray *cellFrameArray = [NSMutableArray array];
         for (WZObjectLists *status in statusArray) {
             WZCellFrame *cellFrame = [[WZCellFrame alloc] init];
             // 传递微博模型数据
             cellFrame.objectLists = status;
             [cellFrameArray addObject:cellFrame];
         }
         
         // 添加新数据到旧数据的后面
         [self.cellFrame addObjectsFromArray:cellFrameArray];
         // 刷新
         [self.collectionView reloadData];
         
         // 让刷新控件停止显示刷新状态
         [self.footer endRefreshing];
         [MBProgressHUD showSuccess:@"刷新成功"];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"fail");
         [self.footer endRefreshing];
     }];
    
    
}
/**
 *  // 刷新数据(取更新的画报数据)
 */
- (void)loadNewData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.说明服务器返回的是Json数据
    //    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 3.发送请求
    [mgr GET:MAIN_URL parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
         NSDictionary *data=responseObject[@"data"];
         
         NSArray *statusArray=[WZObjectLists objectArrayWithKeyValuesArray:data[@"object_list"]];
         // 创建frame模型对象
         NSMutableArray *cellFrameArray = [NSMutableArray array];
         for (WZObjectLists *status in statusArray) {
             WZCellFrame *cellFrame = [[WZCellFrame alloc] init];
             // 传递微博模型数据
             cellFrame.objectLists = status;
             [cellFrameArray addObject:cellFrame];
         }
         // 将最新的数据追加到旧数据的最前面
         // 旧数据: self.statusFrames
         // 新数据: statusFrameArray
         NSMutableArray *tempArray = [NSMutableArray array];
         // 添加statusFrameArray的所有元素 添加到 tempArray中
         [tempArray addObjectsFromArray:cellFrameArray];
         // 添加self.statusFrames的所有元素 添加到 tempArray中
         [tempArray addObjectsFromArray:self.cellFrame];
         // 赋值
         self.cellFrame = tempArray;
         
         // 刷新
         [self.collectionView reloadData];
         
         // 让刷新控件停止显示刷新状态
         [self.header endRefreshing];
         [MBProgressHUD showSuccess:@"刷新成功"];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"fail");
         [self.header endRefreshing];
     }];
    
}
- (void)dealloc
{
    // 释放内存
    [self.header free];
    [self.footer free];
}

#pragma mark UICollectionViewDataSource
//required
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

/* For now, we won't return any sections */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellFrame.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    self.cell = [WZCollectionViewCell cellWithCollectionView:collectionView cellForRowAtIndexPath:indexPath];
    // 2.传递frame模型
    self.cell.cellFrame=self.cellFrame[indexPath.item];
    return self.cell;
}
#pragma mark - UICollectionViewDelegateFlowLayout
/**定义每个UICollectionView 的大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    WZCellFrame *cellFrame=self.cellFrame[indexPath.item];
    
    return CGSizeMake(DeviceWidth/2,cellFrame.cellH);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(WZBorder, WZBorder, WZBorder,WZBorder);
}

/**定义每个UICollectionView 纵向的间距*/
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - UICollectionView Delegate
/**UICollectionView被选中时调用的方法*/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //select Item
    WZMainDetailController *detail = [[WZMainDetailController alloc] init];
    
    WZCellFrame *cellFrame=self.cellFrame[indexPath.item];
    detail.datas=cellFrame.objectLists;
    [self.navigationController pushViewController:detail animated:YES];

//    NSLog(@"row= %li,section = %li",(long)indexPath.item,(long)indexPath.section);
}
/**返回这个UICollectionView是否可以被选择*/
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
@end
