//
//  WZThirdRowCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/14.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZThirdRowCell.h"
#import "UIImage+MJ.h"
#import "WZRelatedAlbums.h"
#import "UIImageView+WebCache.h"
#import "WZUser.h"
@interface WZThirdRowCell ( )
//收藏以下专辑个数
@property(nonatomic ,weak)UILabel *storeCount;
//收藏专辑集合
@property(nonatomic ,weak)UIScrollView *scrollView;
@end

@implementation WZThirdRowCell
-(void)setDatas:(WZObjectLists *)datas
{
    _datas=datas;
    
    //设置收藏数
    self.storeCount.text=[NSString stringWithFormat:@"%d",_datas.favorite_count];
    
    // 0.取出模型数据
    NSArray *relateAlbums=_datas.related_albums;
    
    // 1.添加图片
    CGFloat imageWH = 160;
    CGFloat imageY = 0;
    for (int index=0; index<relateAlbums.count; index++) {
        CGFloat imageX = index * imageWH+WZBorder*index;
        //取得数据模型
        WZRelatedAlbums *relateAlbum=relateAlbums[index];
        WZUser *user=relateAlbum.user;
        
        //添加图片
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius =5;
        NSString *source=[NSString stringWithFormat:@"%@",relateAlbum.covers];
        NSString *from=[source substringFromIndex:7];
        long length = [from rangeOfString:@"\""].location;
        NSString *path=[from substringToIndex:length];
        [imageView setImageWithURL:[NSURL URLWithString:path]placeholderImage:[UIImage imageNamed:@"image_default"]];
        
        // 相关画报的相册名称
        UILabel *name=[[UILabel alloc]init];
        name.text=relateAlbum.name;
        name.font=[UIFont boldSystemFontOfSize:15];
        [name setTextColor:[UIColor whiteColor]];
        name.frame=CGRectMake(2*WZBorder, 110, 140, 20);
        [imageView addSubview:name];
            
        // 画报的用户名
        UILabel *username=[[UILabel alloc]init];
        username.text=[NSString stringWithFormat:@"by:%@",user.username];
        username.font=[UIFont boldSystemFontOfSize:15];
        [username setTextColor:[UIColor whiteColor]];
        username.frame=CGRectMake(2*WZBorder, 130, 140, 20);
        [imageView addSubview:username];
        
        imageView.frame = CGRectMake(imageX, imageY, imageWH, imageWH);
        self.scrollView.contentSize=CGSizeMake((imageWH+WZBorder)*relateAlbums.count, imageWH);
        [self.scrollView addSubview:imageView];
        
        //左上角首发按钮
        UIButton *publishBtn=[[UIButton alloc]init];
        publishBtn.enabled= NO;
        publishBtn.backgroundColor=[UIColor redColor];
        [publishBtn setTitle:@"首发" forState:UIControlStateNormal];
        publishBtn.frame=CGRectMake(0, 0, 50, 20);
        [self.scrollView addSubview:publishBtn];
    }
}
#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"thirdRow";
    WZThirdRowCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WZThirdRowCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius =5;
        CGFloat cellW = DeviceWidth-2*WZBorder;

        //背景
        UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth-2*WZBorder, 250)];
        [image setImage:[UIImage resizedImageWithName:@"bar_base_middle"]];
        [self addSubview:image];
        //收藏到以下专辑
        UILabel *label=[[UILabel alloc]init];
        label.frame=CGRectMake(15, 15, cellW/2, 30);
        label.font=[UIFont boldSystemFontOfSize:20];
        label.text=@"收藏到以下专辑";
        [self addSubview:label];
        
        //收藏专辑的用户数
        UILabel *storeCount=[[UILabel alloc]init];
        storeCount.frame=CGRectMake(cellW-60, 15, 30, 30);
        storeCount.font=[UIFont systemFontOfSize:15];
        [storeCount setTextColor:[UIColor grayColor]];
        [self addSubview:storeCount];
        self.storeCount=storeCount;
        
        //查看收藏专辑的用户详情按钮
        UIButton *storeBtn=[[UIButton alloc]init];
        [storeBtn setImage:[UIImage imageNamed:@"common_icon_arrow"] forState:UIControlStateNormal];
        [storeBtn setImage:[UIImage imageNamed:@"common_icon_arrow"] forState:UIControlStateHighlighted];
        storeBtn.frame=CGRectMake(cellW-50, WZBorder, 50, 50);
        [self addSubview:storeBtn];
        

        //分割线
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[UIColor grayColor];
        line.frame=CGRectMake(WZBorder, 60, cellW-2*WZBorder, 0.5);
        [self addSubview:line];
        
        //收藏专辑封面ScrollView
        UIScrollView *scrollView=[[UIScrollView alloc]init];
        scrollView.showsHorizontalScrollIndicator= NO;
        scrollView.frame=CGRectMake(WZBorder, 70, cellW-2*WZBorder, 160);
        [self addSubview:scrollView];
        self.scrollView=scrollView;
    
    }
    return self;
}
/**
 *  拦截frame的设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += WZBorder;
    frame.origin.x = WZBorder;
    frame.size.width -= 2 * WZBorder;
    frame.size.height -= 2 *WZBorder;
    [super setFrame:frame];
}
@end
