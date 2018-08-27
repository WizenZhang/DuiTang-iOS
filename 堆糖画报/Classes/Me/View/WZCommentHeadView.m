//
//  WZCommentHeadView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCommentHeadView.h"
#import "WZCommentUpModel.h"
#import "WZDrawerRightPhoto.h"
#import "UIImageView+WebCache.h"
#import "JXLDayAndNightMode.h"
#import "UIImage+MJ.h"
@interface WZCommentHeadView ()
/**评论页面头部图片*/
@property (nonatomic, weak) UIImageView *photo;
/**评论页面背景图片*/
@property (nonatomic, weak) UIImageView *imageview;
/**评论页面头部名称*/
@property (nonatomic, weak) UILabel *name;
/**评论页面头部描述*/
@property (nonatomic, weak) UITextView *desc;
/**评论上部成员数目*/
@property (nonatomic, weak) UIButton *member;
@end
@implementation WZCommentHeadView

-(void)setData:(WZCommentUpModel *)data
{
    _data=data;
    WZDrawerRightPhoto *photos=_data.photo;
    NSURL *imageurl=[NSURL URLWithString:photos.path];
    [self.imageview setImageWithURL:imageurl placeholderImage:[UIImage imageNamed:@"image_default"]];
    
    [self.photo setImageWithURL:imageurl placeholderImage:[UIImage imageNamed:@"image_default"]];
    
    self.name.text=_data.name;
    self.desc.text=_data.desc;
  
    NSString *count=[NSString stringWithFormat:@" 成员%d",_data.member_count];
    [_member setTitle:count forState:UIControlStateNormal];
}
- (void)blurBackgroundImage
{
    
    
    
}
- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        self.frame=CGRectMake(0, 0, DeviceWidth, 210);
        self.backgroundColor=[UIColor grayColor];
        //背景图片毛玻璃处理
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.contentMode = UIViewContentModeScaleToFill;
        imageview.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-70);
        [self addSubview:imageview];
        self.imageview=imageview;

        UIVisualEffectView *effectview=[UIImage effectViewWithFrame:CGRectMake(0, 0, imageview.frame.size.width , imageview.frame.size.height)];
        [imageview addSubview:effectview];
        
        //评论页面头部图片
        UIImageView *bg=[[UIImageView alloc]init];
        bg.frame=CGRectMake(20, 20, 100, 100);
        bg.backgroundColor=[UIColor whiteColor];
        [effectview addSubview:bg];
        
        //评论页面头部图片
        UIImageView *photo=[[UIImageView alloc]init];
        photo.frame=CGRectMake(23, 23, 94, 94);
        [effectview addSubview:photo];
        self.photo=photo;
        
        //评论页面头部名称
        UILabel *name=[[UILabel alloc]init];;
        name.frame=CGRectMake(135, 25, DeviceWidth-160, 30);
        name.textColor=[UIColor whiteColor];
        name.textAlignment=NSTextAlignmentLeft;
        [effectview addSubview:name];
        self.name=name;

        //评论页面头部描述
        UITextView *desc=[[UITextView alloc]init];;
        desc.frame=CGRectMake(133, 50, DeviceWidth-160, 60);
        desc.backgroundColor=[UIColor clearColor];
        desc.textAlignment=NSTextAlignmentLeft;
        desc.font=MsgFont;
        desc.textColor=[UIColor whiteColor];
        [effectview addSubview:desc];
        self.desc=desc;

        //评论页面头部toolbar
        UIImageView *tool=[[UIImageView alloc]init];
        tool.frame=CGRectMake(0, 140, DeviceWidth, 70);
        [effectview addSubview:tool];
        
        //评论页面头部toolbar上成员人数
        UIButton *member=[[UIButton alloc]init];
        member.titleLabel.font=UIBoldFont(15);
        [member setImage:[UIImage imageNamed:@"member"] forState:UIControlStateNormal];
        member.frame=CGRectMake(-30, 15, 200, 40);
        [tool addSubview:member];
        self.member=member;
        
        //评论页面头部toolbar加入Club
        UIButton *join=[[UIButton alloc]init];
        [join setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        join.titleLabel.font=NameFont;
        [join setTitle:@"加入Club" forState:UIControlStateNormal];
        join.frame=CGRectMake(DeviceWidth-15-120, 15, 120, 40);
        join.backgroundColor=WZColor(46, 204, 113);
        [tool addSubview:join];
    
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
             tool.backgroundColor=[UIColor whiteColor];
             [member setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        } nightMode:^(UIView *view) {
            tool.backgroundColor=WZNightbgColor;
            [member setTitleColor:WZNightTextColor forState:UIControlStateNormal];
        }];
    
    }
    return self;
}


@end
