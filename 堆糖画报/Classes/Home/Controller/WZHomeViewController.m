//
//  WZHomeViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/12.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZHomeViewController.h"
#import "WaterFLayout.h"
#import "WZCollectionViewController.h"
@implementation WZHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    WaterFLayout *flowLayout = [[WaterFLayout alloc]init];
    self.waterfall = [[WZCollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
    self.waterfall.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.waterfall.view];
    
}
@end
