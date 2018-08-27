//
//  WZClubCommentController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZClubCommentController.h"
#import "WZCommentHeadView.h"
#import "WZHttpRequestManager.h"
#import "WZCommentUpModel.h"
#import "WZCommentDownModel.h"
#import "MJExtension.h"
#import "WZCommentFrame.h"
#import "WZCommentCell.h"
#import "JXLDayAndNightMode.h"
@interface WZClubCommentController ()
@property(nonatomic,strong)WZHttpRequestManager *manger;
@property(nonatomic,strong)NSMutableArray *cellFrame;
@property(nonatomic,strong)NSArray *statusArray;
@property(nonatomic,strong)WZCommentUpModel *upData;
@end

@implementation WZClubCommentController
- (NSMutableArray *)cellFrame
{
    if (_cellFrame == nil) {
        _cellFrame = [NSMutableArray array];
    }
    return _cellFrame;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [self.view jxl_setDayMode:^(UIView *view) {
        // 设置日间模式状态
        view.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        // 设置夜间模式状态
        view.backgroundColor = WZNightCellColor;
    }];


    [self loadTableViewData];
    [self loadHeadViewData];
   
}
- (void)loadHeadViewData
{
    
    NSString *path = [NSString stringWithFormat:CLUBRIGHTUPDETAIL_URL,_ID];
    
    _manger = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
       
        WZCommentHeadView *head=[[WZCommentHeadView alloc]init];
        head.data=[WZCommentUpModel objectWithKeyValues:dict[@"data"]];
        self.tableView.tableHeaderView=head;
        
    }];
 
}
- (void)loadTableViewData
{
    
    NSString *path = [NSString stringWithFormat:CLUBRIGHTDOWNDETAIL_URL,_ID];


    _manger = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data=dict[@"data"];
        _statusArray=[WZCommentDownModel objectArrayWithKeyValuesArray:data[@"object_list"]];
//        NSLog(@"%@",data[@"object_list"]);
        // 创建frame模型对象
        NSMutableArray *cellFrameArray = [NSMutableArray array];
        for (WZCommentDownModel *status in _statusArray) {
            WZCommentFrame *cellFrame = [[ WZCommentFrame alloc] init];
            // 传递模型数据
            cellFrame.object_list = status;
            [cellFrameArray addObject:cellFrame];
        }
        
        // 添加新数据到旧数据的后面
        self.cellFrame =cellFrameArray;

        // 刷新
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
    
    return _cellFrame.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    WZCommentCell *cell=[WZCommentCell cellWithTableView:tableView];
    cell.cellFrame=_cellFrame[indexPath.row];
    return cell;
    
}
#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WZCommentFrame *cellF=_cellFrame[indexPath.row];
    return cellF.cellH;
}
@end


