//
//  WZMainDetailController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/13.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMainDetailController.h"
#import "WZHttpRequestManager.h"
#import "WZNetInterface.h"
#import "WZObjectLists.h"
#import "WZRelatedAlbums.h"
#import "MJExtension.h"
@interface WZMainDetailController ()
@property(nonatomic,strong)NSArray *statuses;
@property (nonatomic,strong) WZHttpRequestManager *manager;
@end

@implementation WZMainDetailController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor purpleColor];
    NSString *path = [NSString stringWithFormat:MAINDETAIL_URL,@571642623];
    
    self.manager = [[WZHttpRequestManager alloc] initWithUrlString:path andBlock:^(WZHttpRequestManager *manager) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:manager.data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary * dict = dic[@"data"];
        self.datas=[[WZObjectLists alloc]initWithDictionary:dict error:nil];
       self.statuses=[WZRelatedAlbums objectArrayWithKeyValuesArray:dict[@"related_albums"]];
        WZRelatedAlbums *relate=self.statuses[0];
        NSLog(@"%@",relate.name);
  
    }];



}

@end
