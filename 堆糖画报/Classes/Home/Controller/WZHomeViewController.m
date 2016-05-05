//
//  WZHomeViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZHomeViewController.h"
#import "AFNetworking.h"
#import "WZHomeHeadData.h"
#import "UIImageView+WebCache.h"
#import "WZHomeHeadView.h"
#define fDeviceWidth 375
#define fDeviceHeight 647

@interface WZHomeViewController ()
@property(nonatomic,strong)NSArray *statuses;
@end

@implementation WZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.加载主页顶部数据
//    [self loadHomeTopData];
    
    //添加collectionView
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    //设置collectionView垂直滚动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //头部Frame
     flowLayout.headerReferenceSize = CGSizeMake(fDeviceWidth, 230);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, fDeviceWidth, fDeviceHeight) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    //注册cell和ReusableView（相当于头部）
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
   }

//头部显示的内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
    //图片轮播器添加头部显示
    [headerView addSubview:[WZHomeHeadView headerView]];//头部图片轮播器
    return headerView;
}

- (void)loadHomeTopData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.说明服务器返回的是Json数据
    //    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 3.发送请求
    [mgr GET:@"http://www.duitang.com/napi/ad/banner/week/?platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&adid=ANA001&app_code=nayutas" parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSArray *dictArray=responseObject[@"data"];
         NSMutableArray *dataArray=[NSMutableArray array];
         for (NSDictionary *dict in dictArray) {
             WZHomeHeadData *data=[WZHomeHeadData dataWithDict:dict];
             [dataArray addObject:data];
         }
         self.statuses=dataArray;
//         [self.tableView reloadData];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"fail");
     }];
 
}
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    cell.backgroundColor = [UIColor purpleColor];
    //    cell.imgView.image = [UIImage imageNamed:@"cat.png"];
    //    cell.text.text = [NSString stringWithFormat:@"Cell %ld",indexPath.row];
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //边距占5*4=20 ，2个
    //图片为正方形，边长：(fDeviceWidth-20)/2-5-5 所以总高(fDeviceWidth-20)/2-5-5 +20+30+5+5 label高20 btn高30 边
//    if (indexPath.row==0) {
//        return CGSizeMake(375, 50);
//    }
    return CGSizeMake((fDeviceWidth-20)/2, (fDeviceWidth-20)/2+50);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end
