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

@interface WZUserDetailController ()
@property (nonatomic, strong) WZCollectionViewCell *cell;
@property (nonatomic,strong) WZHttpRequestManager *manager;
@property(nonatomic,strong)NSMutableArray *cellFrame;
@property(nonatomic,strong)WZRelatedAlbums *status;

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

    //设置setcollectionView
    [self setCollectionView];
    
    //加载头部数据
    [self setHeadViewData];
    
    //加载collectionView数据
    [self setCollectionViewData];
   
}
- (void)setHeadViewData
{
   //    NSString *path = [NSString stringWithFormat:@"http://www.duitang.com/napi/album/detail/?include_fields=share_links_2%%2Ccovers%%2Cmembers%%2Cmember_count%%2Cmanagers&platform_version=4.2.2&device_platform=YUSUN%%2BLA2-W&__dtac=%%257B%%2522_r%%2522%%253A%%2520%%2522316784%%2522%%257D&screen_width=720&screen_height=1280&app_version=57&album_id=%@&platform_name=Android&locale=zh&app_code=nayutas",_relatedAlbums.id];
}
- (void)setCollectionViewData
{
    NSString *path = [NSString stringWithFormat:BANNERDETAILDOWN_URL,5,_relatedAlbums.id];
    
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.说明服务器返回的是Json数据
    //    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 3.发送请求
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
         // 赋值
         self.cellFrame = cellFrameArray;
         
         // 刷新
         [self.collectionView reloadData];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"fail");
         
     }];

}
- (void)setCollectionView
{
    self.collectionView.backgroundColor=WZColor(223, 224, 225);
    self.collectionView.frame=CGRectMake(0, 0, DeviceWidth, DeviceHeight);
    [self.collectionView registerClass:[WZCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[WaterFallHeader class]  forSupplementaryViewOfKind:WaterFallSectionHeader withReuseIdentifier:@"WaterFallSectionHeader"];
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
    
        NSLog(@"row= %li,section = %li",(long)indexPath.item,(long)indexPath.section);
}
/**返回这个UICollectionView是否可以被选择*/
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
