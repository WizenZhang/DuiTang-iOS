//
//  WZCollectionViewCell.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZCollectionViewCell : UICollectionViewCell

@property(nonatomic ,strong)UIImageView *photo;
@property(nonatomic ,strong)UILabel *msg;
@property(nonatomic ,strong)UIImageView *replay_countP;
@property(nonatomic ,strong)UILabel *replay_count;
@property(nonatomic ,strong)UIImageView *like_countP;
@property(nonatomic ,strong)UILabel *like_count;
@property(nonatomic ,strong)UIImageView  *favorite_countP;
@property(nonatomic ,strong)UILabel *favorite_count;
@property(nonatomic ,strong)UIView *line;
@property(nonatomic ,strong)UIImageView *avator;
@property(nonatomic ,strong)UILabel *name;
@property(nonatomic ,strong)UILabel *username;

@end
