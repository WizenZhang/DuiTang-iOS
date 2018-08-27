//
//  WZSortHeadDetail.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSortHeadDetail.h"
#import "WZDetailHeadData.h"
#import "WZSubCates.h"
#import "UIImage+MJ.h"
#import "JXLDayAndNightMode.h"
#import "WZDetailHeadData.h"
#import "UIImageView+WebCache.h"
@interface WZSortHeadDetail ()

@end
@implementation WZSortHeadDetail

- (id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;

            }
    return self;
}

- (void)setData:(WZDetailHeadData *)data
{
    _data=data;
    
    long countH=(_data.sub_cates.count+2)/3;
    CGFloat buttonW = (DeviceWidth -15*4)/3.0;
    CGFloat buttonH = 30;
    CGFloat headH=10+(buttonH+10)*countH;
    self.frame=CGRectMake(0, -64, DeviceWidth, headH+64);
    //背景图片毛玻璃处理
    [self blurBackgroundImage];

    for (int i = 0; i<_data.sub_cates.count; i++) {
        
        WZSubCates *subCates=_data.sub_cates[i];

        int row = i/3;
        int column = i%3;
        
        CGFloat buttonX = (buttonW+15)*column+15;
        CGFloat buttonY = (buttonH+2*WZBorder)*row+2*WZBorder+64;
        
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button setBackgroundImage:[UIImage resizedImageWithName:@"transparent_button"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage resizedImageWithName:@"transparent_button"] forState:UIControlStateHighlighted];
        button.tag=i;
        button.titleLabel.font = UIFont(16);
        
        [button setTitle:[NSString stringWithFormat:@"#%@",subCates.name] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
}
- (void)buttonClick:(UIButton *)button{
   
    //传递数据
    WZSubCates *subCates=_data.sub_cates[button.tag];
    self.name=subCates.name;
    NSString *str=subCates.theme_name;
    if ([str hasPrefix:@"Heap_"]) {
        NSString *string = [NSString stringWithFormat:@"%@_%@",_data.name,subCates.name];
        self.theme_name=string;
      }else{
        self.theme_name=str;
    }
    
    //通知代理
    if ([self.delegate respondsToSelector:@selector(headViewClickButton:)]) {
        [self.delegate headViewClickButton:self];
    }

}
- (void)blurBackgroundImage
{
    //图片路径处理
    NSMutableString *str = [[NSMutableString alloc]initWithCapacity:0];
    [str appendString:[NSString stringWithFormat:@"%@",_path]];
    NSRange range = [str rangeOfString:@"_webp"];
    if (range.location == NSNotFound) {
        //         NSLog(@"没有找到");
        //        NSLog(@"%@",photo.path);
    }else{
        [str deleteCharactersInRange:range];
        
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.contentMode = UIViewContentModeScaleToFill;
        imageview.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:imageview];
        [imageview setImageWithURL:[NSURL URLWithString:str]placeholderImage:[UIImage imageNamed:@"image_default"]];
        
        UIVisualEffectView *effectview=[UIImage effectViewWithFrame:CGRectMake(0, 0, imageview.frame.size.width , imageview.frame.size.height)];
        [imageview addSubview:effectview];

    }
}

@end
