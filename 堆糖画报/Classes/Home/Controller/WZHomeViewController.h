//
//  WZHomeViewController.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZHomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@end
