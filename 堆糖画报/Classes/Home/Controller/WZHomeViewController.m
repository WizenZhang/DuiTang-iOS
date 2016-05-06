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
#import "MJExtension.h"
#import "WZObjectLists.h"
#import "WZPhoto.h"
#import "WZAlbum.h"
#import "WZSender.h"
#import "WZCollectionViewCell.h"

@interface WZHomeViewController ()
@property(nonatomic,strong)NSArray *ObjectLists;
@end

@implementation WZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.加载主页Cell数据
    [self loadHomeCellData];
    
    //添加collectionView
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    //设置collectionView垂直滚动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //头部Frame
     flowLayout.headerReferenceSize = CGSizeMake(DeviceWidth, 230);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    //注册cell和ReusableView（相当于头部）
    [self.collectionView registerClass:[WZCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
   }

//头部显示的内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
    //图片轮播器添加头部显示
    [headerView addSubview:[WZHomeHeadView headerView]];//头部图片轮播器
    return headerView;
}

- (void)loadHomeCellData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.说明服务器返回的是Json数据
    //    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 3.发送请求
    [mgr GET:@"http://www.duitang.com/napi/index/hot/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count&platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&start=0&app_version=57&platform_name=Android&locale=zh&app_code=nayutas" parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSDictionary *data=responseObject[@"data"];
         self.ObjectLists=[WZObjectLists objectArrayWithKeyValuesArray:data[@"object_list"]];

        [self.collectionView reloadData];

     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"fail");
     }];
 
}
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.ObjectLists.count;
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
    WZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    //取出总的数据模型
    WZObjectLists *ObjectList=self.ObjectLists[indexPath.row];
    WZPhoto *photo=ObjectList.photo;
    
    //加载画报配图
    NSMutableString *str = [[NSMutableString alloc]initWithCapacity:0];
    [str appendString:[NSString stringWithFormat:@"%@",photo.path]];
    NSRange range = [str rangeOfString:@"_webp"];
    if (range.location == NSNotFound) {
            NSLog(@"没有找到");
     }else{
    [str deleteCharactersInRange:range];
    [cell.photo setImageWithURL:[NSURL URLWithString:str]placeholderImage:[UIImage imageNamed:@"image_default"]];
     }
    //加载画报配图描述
    cell.msg.text = [NSString stringWithFormat:@"%@",ObjectList.msg];
    
    //加载画报的评论数
    cell.replay_count.text=[NSString stringWithFormat:@"%@",ObjectList.reply_count];
    
    //加载画报的被赞数
    cell.like_count.text=[NSString stringWithFormat:@"%@",ObjectList.like_count];
    
    //加载画报的收藏数
    cell.favorite_count.text=[NSString stringWithFormat:@"%@",ObjectList.favorite_count];
    
    //加载画报的发布者头像
    [cell.avator setImageWithURL:[NSURL URLWithString:ObjectList.sender.avatar]placeholderImage:[UIImage imageNamed:@"image_default"]];
    
    //加载画报的配图所属相册名称
    cell.name.text=ObjectList.album.name;
    
    //加载画报的发布者昵称
    cell.username.text=ObjectList.sender.username;
    
    
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //边距占5*4=20 ，2个
    //图片为正方形，边长：(DeviceWidth-20)/2-5-5 所以总高(DeviceWidth-20)/2-5-5 +20+30+5+5 label高20 btn高30 边
//    if (indexPath.row==0) {
//        return CGSizeMake(375, 50);
//    }
    return CGSizeMake((DeviceWidth/2)-10, 400);
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
