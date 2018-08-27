//
//  WZMyCollectionViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMyCollectionViewController.h"
#import "JXLDayAndNightMode.h"
#import "WZStoreViewCell.h"
#import "WZObjectLists.h"
#import "WZMainDetailController.h"
#import "WZPhoto.h"
#import "WZAlbum.h"
#import "WZSender.h"
#import "WaterFLayout.h"
#import "DataCenter.h"

@interface WZMyCollectionViewController ()
@property (nonatomic,strong) DataCenter *centerData;
@property (nonatomic, strong) WZStoreViewCell *cell;
@property (nonatomic,strong) NSArray *statusArray;

@end

@implementation WZMyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
- (id)init
{
    WaterFLayout *flowLayout = [[WaterFLayout alloc]init];
    self = [super initWithCollectionViewLayout:flowLayout];
    if (self)
    {
        
        //设置日间和夜间两种状态模式
        [self setDayAndNight];
        
        self.collectionView.frame=CGRectMake(0, 0, DeviceWidth, DeviceHeight);
        [self.collectionView registerClass:[WZStoreViewCell class] forCellWithReuseIdentifier:@"storeCell"];

    }
    return self;
}
/**
 *  从数据库加载数据
 */
- (void)loadData
{
    _centerData = [DataCenter sharedCenter];
   
    _statusArray = [_centerData getDataWithType:kRecordTypeWithCollection];

        if (_statusArray.count == 0) {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请先收藏！" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        
        [alertView show];
        
        [self.view addSubview:alertView];
        return;
    }
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

#pragma mark UICollectionViewDataSource
//required
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

/* For now, we won't return any sections */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _statusArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    self.cell = [WZStoreViewCell cellWithCollectionView:collectionView cellForRowAtIndexPath:indexPath];
    // 2.传递frame模型
    self.cell.objectLists=_statusArray[indexPath.item];
    return self.cell;
}
#pragma mark - UICollectionViewDelegateFlowLayout
/**定义每个UICollectionView 的大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat CellW = (DeviceWidth-3*WZEdge)/2;
    return CGSizeMake(CellW,CellW+30);
}
#pragma mark - UICollectionView Delegate
/**UICollectionView被选中时调用的方法*/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //select Item
    WZMainDetailController *detail = [[WZMainDetailController alloc] init];
    WZObjectLists *objectLists=_statusArray[indexPath.item];
    detail.ID=objectLists.id;
    [self.navigationController pushViewController:detail animated:YES];
    
}
/**返回这个UICollectionView是否可以被选择*/
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
