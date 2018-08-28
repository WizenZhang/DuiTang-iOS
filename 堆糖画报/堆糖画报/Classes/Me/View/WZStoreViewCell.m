//
//  WZStoreViewCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/26.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZStoreViewCell.h"
#import "JXLDayAndNightMode.h"
#import "UIImageView+WebCache.h"
@interface WZStoreViewCell ()
/**画报的配图*/
@property(nonatomic ,weak)UIImageView *photo;
//画报的发布者昵称
@property(nonatomic ,weak)UILabel *username;
@end
@implementation WZStoreViewCell
#pragma mark - 初始化

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *identify = @"storeCell";
    WZStoreViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    return cell;
}
- (void)setObjectLists:(WZObjectLists *)objectLists
{
    _objectLists=objectLists;
    WZPhoto *photo=_objectLists.photo;
    WZSender *sender=_objectLists.sender;
    
    // 1.画报的配图
    [self.photo setImageWithURL:[NSURL URLWithString:photo.path]placeholderImage:[UIImage imageNamed:@"image_default"]];
    
    // 2.画报的发布者昵称
    self.username.text=[NSString stringWithFormat:@"by:%@",sender.username];

}
- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        // 画报的配图
        CGFloat CellW = (DeviceWidth-3*WZEdge)/2;
        UIImageView *photo=[[UIImageView alloc]init];
        photo.frame=CGRectMake(0, 0, CellW, CellW);
        self.photo=photo;
        [self addSubview:self.photo];
        
        //画报的发布者昵称
        UILabel *username=[[UILabel alloc]init];
        username.font = NameFont;
        username.frame=CGRectMake(0, CellW, CellW, 30);
        username.textAlignment=NSTextAlignmentCenter;
        username.textColor=[UIColor grayColor];
        [self addSubview:username];
        self.username=username;
        
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            self.username.textColor=[UIColor grayColor];
        } nightMode:^(UIView *view) {
            self.username.textColor=WZNightTextColor;
        }];
    }
    return self;
}

@end
