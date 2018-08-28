//
//  WZCategoryHeadView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/20.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCategoryHeadView.h"
#import "iCarousel.h" 
#import "WZGroupHead.h"
#import "UIImageView+WebCache.h"
#import "JXLDayAndNightMode.h"
@interface WZCategoryHeadView ()<iCarouselDataSource,iCarouselDelegate>
/**画报的分类头部主目录标题*/
@property(nonatomic,strong)UILabel *title;
/**画报的分类头部旋转木马*/
@property (nonatomic,strong) iCarousel *carousel;
@end
@implementation WZCategoryHeadView

- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {

        self.frame=CGRectMake(0, 0, DeviceWidth,200);
        
        //分类标题
        UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(WZBorder, 2*WZBorder, 120, 20)];
        title.textColor=[UIColor grayColor];
        title.font=CategoryTitleFont;
        title.text=@"流行趋势";
        [self addSubview:title];
        self.title=title;
        
        //旋转木马
        iCarousel *carousel = [[iCarousel alloc] initWithFrame:CGRectMake(WZBorder,30, DeviceWidth-2*WZBorder, 160)];
        carousel.type=iCarouselTypeRotary;
        [self addSubview:carousel];
        self.carousel=carousel;
        self.carousel.delegate = self;
        
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            self.backgroundColor=[UIColor whiteColor];
            
        } nightMode:^(UIView *view) {
            self.backgroundColor=WZNightCellColor;
            
        }];

    }
    return self;
}
- (void)setGroup_items:(NSArray *)group_items
{
    _group_items=group_items;
    
    //设置旋转木马数据
    self.carousel.dataSource = self;
}

#pragma mark -carouselDelegate
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return _group_items.count-1;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{

    WZGroupHead *item=_group_items[index];
    CGFloat viewWidth = (DeviceWidth - 2*WZBorder) / 3.0;
    
    //旋转的View
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 3*WZBorder, viewWidth +40, viewWidth+40);
    
    //添加旋转图片
    UIImageView * imageview = [[UIImageView alloc]init];
    imageview.tag=index;
    [imageview setImageWithURL:[NSURL URLWithString:item.icon_url]placeholderImage:[UIImage imageNamed:@"image_default"]];
    imageview.frame = CGRectMake(2*WZBorder, 2*WZBorder, viewWidth+20, viewWidth+20);
    imageview.clipsToBounds = YES;
    imageview.layer.cornerRadius = 2*WZBorder;
    imageview.userInteractionEnabled = YES;
    [view addSubview:imageview];
    
    //添加旋转图片标题
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(2*WZBorder,CGRectGetMaxY(imageview.bounds), viewWidth, 40);
    label.textColor=[UIColor grayColor];
    label.font=NameFont;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.clipsToBounds = YES;
    label.layer.cornerRadius = 2;
    label.numberOfLines = 0;
    label.text=item.name;
    [view addSubview:label];
    
    //添加图片点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMethod:)];
    [imageview addGestureRecognizer:tap];

    return view;
}
/** 图片点击方法 */
- (void)tapMethod:(UITapGestureRecognizer *)tap{
    
    UIImageView *imageView = (UIImageView *)tap.view;
    //传递的画报ID
    WZGroupHead *item=_group_items[imageView.tag];
    long location=[item.target rangeOfString:@"id="].location+3;
    long length=[item.target rangeOfString:@"&"].location-location;
    NSString *ID=[item.target substringWithRange:NSMakeRange(location, length)];
    self.ID=ID;
    self.name=item.name;
    //通知代理
    if ([self.delegate respondsToSelector:@selector(headViewClickImage:)]) {
        [self.delegate headViewClickImage:self];
    }
    
   
}
@end
