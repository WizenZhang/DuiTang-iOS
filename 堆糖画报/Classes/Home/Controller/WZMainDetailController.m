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
@interface WZMainDetailController () <WZThirdRowCellDelegate>
@property (nonatomic,strong) WZHttpRequestManager *manager;
@end

@implementation WZMainDetailController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle=NO;
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, WZBorder, 0);
    self.view.backgroundColor=WZColor(223, 224, 225);
    //加载选中item所对应数据
    [self loadDatas];

}
-(void)loadDatas
{
    //通过画报ID获得选中item所对应数据
    NSString *path = [NSString stringWithFormat:MAINDETAIL_URL,_datas.id];
    
    _manager = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
       
        NSDictionary * dict = dic[@"data"];    
        self.datas=[[WZObjectLists alloc]initWithDictionary:dict error:nil];
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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        // 1.创建cell
        WZFirstRowCell *cell = [WZFirstRowCell cellWithTableView:tableView];
        self.detailCellFrame=[[WZDetailCellFrame alloc]init];
        // 2.传递Frame模型
        self.detailCellFrame.datas=_datas;
        // 3.传递数据模型
        cell.datas = _datas;
        return cell;
        
    }else if(indexPath.row==1){
        // 1.创建cell
        WZSecondRowCell *cell = [WZSecondRowCell cellWithTableView:tableView];
        // 2.传递数据模型
        cell.datas = _datas;
        return cell;
    }else{
        // 1.创建cell
        WZThirdRowCell *cell = [WZThirdRowCell cellWithTableView:tableView];
        // 2.传递数据模型
        cell.datas = _datas;
        cell.delegate=self;
        return cell;
    }
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
        //传递数据模型
        NSArray *relateAlbums=_datas.related_albums;
        userDetail.relatedAlbums=relateAlbums[thirdRowCell.imageIndex];
    [self.navigationController pushViewController:userDetail animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
   
    [self.navigationController pushViewController:vc animated:YES];

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
