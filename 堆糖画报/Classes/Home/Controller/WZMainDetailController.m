//
//  WZMainDetailController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/13.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMainDetailController.h"
#import "WZUserDetailController.h"
#import "WZHttpRequestManager.h"
#import "WZNetInterface.h"
#import "WZObjectLists.h"
#import "WZRelatedAlbums.h"
#import "MJExtension.h"
#import "WZFirstRowCell.h"
#import "WZSecondRowCell.h"
#import "WZThirdRowCell.h"
#import "WZDetailCellFrame.h"
#import "WaterFLayout.h"
#import "WZRelatedAlbums.h"
#import "UMSocial.h"
#import "JXLDayAndNightMode.h"
@interface WZMainDetailController () <WZThirdRowCellDelegate>
@property (nonatomic,strong) WZHttpRequestManager *manager;
@property (nonatomic,strong) WZRelatedAlbums *relatedAlbums;
@property (nonatomic,strong) WZObjectLists *datas;
@property(nonatomic,strong)NSArray *items;
@property (nonatomic, strong)NSArray *cellH;
@end

@implementation WZMainDetailController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"详情";
    self.tableView.separatorStyle=NO;
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, WZBorder, 0);
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];
    
    //加载选中item所对应数据
    [self loadDatas];
    //添加分享按钮
    [self addShareButton];
}

- (void)addShareButton
{
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(0, 0, 20, 20);
    
    [shareButton setImage:[UIImage imageNamed:@"ic_actbar_share"] forState:UIControlStateNormal];
    
    [shareButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //    shareButton.backgroundColor = [UIColor redColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:shareButton];
    
    self.navigationItem.rightBarButtonItem = item;
}
- (void)buttonClick:(UIButton *)button{
    
//    button.selected = !button.selected;
    //分享
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"55def769e0f55ae678001c81" shareText:@"我爱画报，好看有好玩，快来玩吧！" shareImage:nil shareToSnsNames:@[UMShareToWechatTimeline,UMShareToSina,UMShareToSms,UMShareToRenren,UMShareToDouban,UMShareToWechatSession,UMShareToEmail] delegate:nil];
}


-(void)loadDatas
{
    //通过画报ID获得选中item所对应数据
    NSString *path = [NSString stringWithFormat:MAINDETAIL_URL,_ID];
    
    _manager = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
       
        NSDictionary * dict = dic[@"data"];    
        self.datas=[[WZObjectLists alloc]initWithDictionary:dict error:nil];
        [self setupItems:self.tableView];
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
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return _items[indexPath.row];
}

/**
 *  第0组数据
 */
- (void)setupItems:(UITableView *)tableView
{
    WZFirstRowCell *firstRowCell = [WZFirstRowCell cellWithTableView:tableView];
    //传递模型数据
    _detailCellFrame=[[WZDetailCellFrame alloc]init];
    _detailCellFrame.datas=_datas;
    firstRowCell.datas = _datas;
    
    WZSecondRowCell *secondRowCell = [WZSecondRowCell cellWithTableView:tableView];
    secondRowCell.datas = _datas;

    WZThirdRowCell *thirdRowCell = [WZThirdRowCell cellWithTableView:tableView];
    thirdRowCell.datas = _datas;
    thirdRowCell.delegate=self;
    _items = @[firstRowCell,secondRowCell,thirdRowCell];
}

#pragma mark - thirdRowCell代理方法
- (void)thirdRowCellClickImage:(WZThirdRowCell *)thirdRowCell
{
     WaterFLayout *layout = [[WaterFLayout alloc]init];
    //设置cell之间的垂直距离
    layout.minimumInteritemSpacing=WZBorder;
    //设置cell之间的水平距离
    layout.minimumColumnSpacing=WZBorder;
 
    WZUserDetailController *userDetail = [[WZUserDetailController alloc] initWithCollectionViewLayout:layout];
    //传递ID数据模型
    NSArray *relateAlbums=_datas.related_albums;
    self.relatedAlbums=relateAlbums[thirdRowCell.imageIndex];
    userDetail.ID=self.relatedAlbums.id;
    [self.navigationController pushViewController:userDetail animated:YES];
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return self.detailCellFrame.cellH;
        
    }else if(indexPath.row==1){
        return 140+WZBorder;
    }else{
        return 250;
    }
}

@end
