//
//  WZThemeDetailView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZThemeDetailView.h"
#import "WZHeadThemeDetail.h"
#import "WZRelatedThemeGroup.h"
#import "UIImageView+WebCache.h"
#import "WZRelateItems.h"
#import "UIImage+MJ.h"
#import "JXLDayAndNightMode.h"
@interface WZThemeDetailView ()
@property (weak, nonatomic) IBOutlet UIImageView *bg;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *dataname;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *groupname;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation WZThemeDetailView
+ (instancetype)initThemeDetailView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WZThemeDetailView" owner:nil options:nil] lastObject];
    
}
- (void)setHeadThemeDetail:(WZHeadThemeDetail *)headThemeDetail
{
    _headThemeDetail=headThemeDetail;
    if (_headThemeDetail) {
        self.frame=CGRectMake(0, 0, DeviceWidth, 180);
        
        [self.icon setImageWithURL:[NSURL URLWithString:_headThemeDetail.image]placeholderImage:[UIImage imageNamed:@"image_default"]];
        self.icon.clipsToBounds=YES;
        self.icon.layer.cornerRadius=50;
        
        self.dataname.text=_headThemeDetail.name;
        self.desc.text=_headThemeDetail.desc;
    }
    //设置日间和夜间两种状态模式
    [self jxl_setDayMode:^(UIView *view) {
        self.backgroundColor=[UIColor whiteColor];
        self.bg.backgroundColor=[UIColor grayColor];
        self.scrollView.backgroundColor=[UIColor whiteColor];
        self.dataname.textColor=[UIColor whiteColor];
        self.desc.textColor=[UIColor whiteColor];
    } nightMode:^(UIView *view) {
        self.backgroundColor=WZNightUserbgColor;
        self.bg.backgroundColor=WZNightUserbgColor;
        self.scrollView.backgroundColor=WZNightUserbgColor;
        self.dataname.textColor=WZNightTextColor;
        self.desc.textColor=WZNightTextColor;

    }];
}
- (void)setRelated_theme_group:(WZRelatedThemeGroup *)related_theme_group
{
    _related_theme_group=related_theme_group;
    if (_related_theme_group) {
        self.frame=CGRectMake(0, 0, DeviceWidth, 330);
        self.groupname.text=_related_theme_group.name;
        CGFloat imageY=WZBorder;
        CGFloat imageHW=100;
        NSArray *relate=_related_theme_group.items;
        CGFloat scrollW=(imageHW+WZBorder)*relate.count;

        //分类详情相关画报配图滚动
        self.scrollView.contentSize=CGSizeMake(scrollW, 130);
        self.scrollView.showsHorizontalScrollIndicator=NO;

        for (int i=0; i<relate.count; i++) {
            WZRelateItems *item=relate[i];
            CGFloat imageX=(WZBorder+imageHW)*i;
            
            UIImageView *relatedImage=[[UIImageView alloc]init];
            relatedImage.tag=i;
            relatedImage.clipsToBounds=YES;
            relatedImage.layer.cornerRadius=3;
            relatedImage.userInteractionEnabled=YES;
            [relatedImage setImageWithURL:[NSURL URLWithString:item.image]placeholderImage:[UIImage imageNamed:@"image_default"]];
            relatedImage.frame=CGRectMake(imageX, imageY, imageHW, imageHW);
            relatedImage.userInteractionEnabled = YES;
            //添加监听方法
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
            [relatedImage addGestureRecognizer:tap];
            [ self.scrollView addSubview:relatedImage];
            
            UILabel *relatedLabel=[[UILabel alloc]init];
            relatedLabel.font=UIFont(13);
            relatedLabel.textColor=[UIColor grayColor];
            relatedLabel.text=item.name;
            relatedLabel.frame=CGRectMake(imageX, CGRectGetMaxY(relatedImage.frame), imageHW, 20);
            [self.scrollView addSubview:relatedLabel];
            
        }
    }

}
- (void)tapMethod:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView=(UIImageView *)tap.view;
    NSArray *relate=_related_theme_group.items;
    WZRelateItems *item=relate[imageView.tag];
    if ([item.target hasPrefix:@"duitang"]) {
        long location=[item.target rangeOfString:@"id="].location+3;
        long length=[item.target rangeOfString:@"&theme_alias"].location-location;
        NSString *ID=[item.target substringWithRange:NSMakeRange(location, length)];
        self.ID=ID;
        //通知代理
        if ([self.delegate respondsToSelector:@selector(headViewClickImage:)]) {
            [self.delegate headViewClickImage:self];
        }
    
    }
}

@end
