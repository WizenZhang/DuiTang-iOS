//
//  WZBottomView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/7.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZBottomView.h"
#import "WZCellFrame.h"
#import "WZObjectLists.h"
#import "WZSender.h"
#import "UIImageView+WebCache.h"
#import "WZAlbum.h"


@interface WZBottomView ()
//画报的发布者头像
@property(nonatomic ,weak)UIImageView *avator;
//画报的所属相册名称
@property(nonatomic ,weak)UILabel *name;
//画报的发布者昵称
@property(nonatomic ,weak)UILabel *username;
@end
@implementation WZBottomView

-(void)setCellFrame:(WZCellFrame *)cellFrame
{
    _cellFrame=cellFrame;
    // 1.取出模型数据
    WZObjectLists *objectList=cellFrame.objectLists;
    WZSender *sender=objectList.sender;
    WZAlbum *album=objectList.album;
    
    // 2.画报的发布者头像
    [self.avator setImageWithURL:[NSURL URLWithString:sender.avatar]placeholderImage:[UIImage imageNamed:@"image_default"]];
    self.avator.clipsToBounds = YES;
    self.avator.layer.cornerRadius =5;
    self.avator.frame=self.cellFrame.avatorF;
    
    // 3.画报的所属相册名称
    self.name.text=[NSString stringWithFormat:@"%@",album.name];
    self.name.frame=self.cellFrame.nameF;
   
    // 4.画报的发布者昵称
    self.username.text=[NSString stringWithFormat:@"by:%@",sender.username];
    self.username.frame=self.cellFrame.usernameF;
    
}
- (id)initWithFrame:(CGRect)frame
{
    
        self=[super initWithFrame:frame];
        if (self) {
        self.backgroundColor=[UIColor whiteColor];
        //画报的发布者头像
        UIImageView *avator=[[UIImageView alloc]init];
        [self addSubview:avator];
        self.avator=avator;
            
        //画报的所属相册名称
        UILabel *name=[[UILabel alloc]init];
        name.font = MainNameFont;
//        name.numberOfLines=0;
        [self addSubview:name];
        self.name=name;
            
        //画报的发布者昵称
        UILabel *username=[[UILabel alloc]init];
        username.font = MainNameFont;
//        username.numberOfLines=0;
        username.textColor=[UIColor grayColor];
        [self addSubview:username];
        self.username=username;
            
    }
    return self;
}


@end
