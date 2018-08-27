//
//  WZUserDetailController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/16.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZUserDetailController.h"
#import "WZCollectionViewCell.h"
#import "WaterFallHeader.h"
#import "WaterFLayout.h"
#import "WZRelatedAlbums.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "WZHttpRequestManager.h"
#import "WZHeadDetailView.h"
#import "WZHeadDetailData.h"
#import "WZMainDetailController.h"
#import "MJRefresh.h"
#import "MBProgressHUD+MJ.h"
#import "JXLDayAndNightMode.h"
#import "UINavigationBar+Awesome.h"
#define NAVBAR_CHANGE_POINT 50
@interface WZUserDetailController ()<MJRefreshBaseViewDelegate>
@property (nonatomic, strong) WZCollectionViewCell *cell;
@property (nonatomic,strong) WZHttpRequestManager *manager;
@property(nonatomic,strong)NSMutableArray *cellFrame;
@property (nonatomic, weak) MJRefreshHeadView *header;
@property (nonatomic, weak) MJRefreshFooterView *footer;
@property(nonatomic,assign)int count;
@property(nonatomic,assign)int page;

@end

@implementation WZUserDetailController

- (NSMutableArray *)cellFrame
{
    if (_cellFrame == nil) {
        _cellFrame = [NSMutableArray array];
    }
    return _cellFrame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"专辑";
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    //设置setcollectionView
    [self setCollectionView];
    
    //加载头部数据
    [self setHeadViewData];
    
    // 集成刷新控件
    [self setupRefreshView];
}
/**
 *  设置日间和夜间两种状态模式
 */
- (void)setDayAndNight
{
    [self.collectionView jxl_setDayMode:^(UIView *view) {
        // 设置日间模式状态
        view.backgroundColor = WZDaybgColor;
    } nightMode:^(UIView *view) {
        // 设置夜间模式状态
        view.backgroundColor = WZNightbgColor;
    }];
}
#pragma mark -scrollView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = self.navigationController.navigationBar.barTintColor;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.collectionView.delegate = self;
    [self scrollViewDidScroll:self.collectionView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.collectionView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}
/**
 *  集成刷新控件
 */
- (void)setupRefreshView
{
    //1.下拉刷新
    MJRefreshHeadView *header = [MJRefreshHeadView head];
    header.scrollView = self.collectionView;
    header.delegate = self;
    // 自动进入刷新状态
    [header beginRefreshing];
    self.header = header;

    // 上拉刷新(上拉加载更多数据)
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
    _page+=24;
    if (_page<_count) { 
        NSString *path = [NSString stringWithFormat:BANNERDETAILDOWN_URL,_page,_ID];
        // 1.创建请求管理对象
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        
        // 2.发送请求
        [mgr GET:path parameters:nil
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
    }else{
        [MBProgressHUD showSuccess:@"没有更多"];
        [self.footer endRefreshing];
    }
    
}
- (void)setHeadViewData
{
       NSString *path = [NSString stringWithFormat:BANNERDETAILUP_UPL,_ID];
    
    _manager = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary * dict = dic[@"data"];
        self.data=[[WZHeadDetailData alloc]initWithDictionary:dict error:nil];
        _count=_data.count;
    }];


}
/**
 *  // 刷新数据(取更新的画报数据)
 */
- (void)loadNewData
{
    NSString *path = [NSString stringWithFormat:BANNERDETAILDOWN_URL,0,_ID];
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [mgr GET:path parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
         NSDictionary *data=responseObject[@"data"];
         
         NSArray *statusArray=[WZObjectLists objectArrayWithKeyValuesArray:data[@"object_list"]];
         //传递顶部毛玻璃图片路径
         WZObjectLists *objectList=statusArray[0];
         WZPhoto *photo=objectList.photo;
         _path=photo.path;
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

- (void)setCollectionView
{
    //设置日间和夜间两种状态模式
    [self setDayAndNight];
    self.collectionView.frame=CGRectMake(0, 0, DeviceWidth, DeviceHeight);
    [self.collectionView registerClass:[WZCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[WaterFallHeader class]  forSupplementaryViewOfKind:WaterFallSectionHeader withReuseIdentifier:@"WaterFallSectionHeader"];
}

/**头部显示的内容**/
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView =[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"WaterFallSectionHeader"forIndexPath:indexPath];
    
    //相册详情添加头部显示
    WZHeadDetailView *headDeatail=[[WZHeadDetailView alloc]init];
    
    //传递数据
    headDeatail.path=_path;
    headDeatail.data=_data;
    [reusableView addSubview:headDeatail];

    return reusableView;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    return 230;
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
    
    return CGSizeMake(cellFrame.CellW,cellFrame.cellH);

}

#pragma mark - UICollectionView Delegate
/**UICollectionView被选中时调用的方法*/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //select Item
    WZMainDetailController *detail = [[WZMainDetailController alloc] init];
    WZCellFrame *cellFrame=self.cellFrame[indexPath.item];
    detail.ID=cellFrame.objectLists.id;
    [self.navigationController pushViewController:detail animated:YES];

//        NSLog(@"row= %li,section = %li",(long)indexPath.item,(long)indexPath.section);
}
/**返回这个UICollectionView是否可以被选择*/
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
