//
//  WZCommentCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCommentCell.h"
#import "UIImage+MJ.h"
#import "UIImageView+WebCache.h"
#import "WZCommentDownModel.h"
#import "WZCommentFrame.h"
#import "WZSender.h"
#import "MJExtension.h"
#import "WZPhoto.h"
#import "JXLDayAndNightMode.h"
@interface WZCommentCell()
/**
 *评论下部评论数目
 */
@property(nonatomic,weak)UIButton *comment_count;
/**
 *评论下部描述
 */
@property(nonatomic,weak)UILabel *content;
/**
 *  评论下部的配图信息
 */
@property (nonatomic, weak) UIImageView *photos;
/**
 *  评论下部发布者名称
 */
@property (nonatomic, weak) UILabel *username;
/**
 *  评论下部评论浏览量
 */
@property (nonatomic, weak) UILabel *visit_count;

@end
@implementation WZCommentCell

- (void)setCellFrame:(WZCommentFrame *)cellFrame
{
    _cellFrame=cellFrame;
    WZCommentDownModel *data=_cellFrame.object_list;
    
    // 评论下部评论数目
    NSString *number=[self rangKiloString:data.comment_count];
    [self.comment_count setTitle:number forState:UIControlStateNormal];
    self.comment_count.frame=_cellFrame.commentF;
    
    //评论下部描述
    self.content.text=data.content;
    self.content.frame=_cellFrame.contentF;
    
    //评论下部的配图信息
    if (data.photos[0]) {
        WZPhoto *photo=[WZPhoto objectWithKeyValues:data.photos[0]];
        [self.photos setImageWithURL:[NSURL URLWithString:photo.path]placeholderImage:[UIImage imageNamed:@"image_default"]];
    }
    self.photos.frame=_cellFrame.photosF;
    
    
    //评论下部发布者名称
    self.username.text=data.sender.username;
    self.username.frame=_cellFrame.usernameF;
    
    NSString *visit=[NSString stringWithFormat:@"浏览 %d",data.visit_count];
    self.visit_count.text=visit;
    self.visit_count.frame=_cellFrame.visit_countF;
//
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"commentCell";
    WZCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WZCommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //取消高亮变灰
        self.selectionStyle= UITableViewCellSelectionStyleNone;
        
         // 评论下部评论数目
        UIButton *comment_count=[[UIButton alloc]init];
        comment_count.titleLabel.font=UIFont(12);
        [comment_count setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [comment_count setBackgroundImage:[UIImage resizedImageWithName:@"blog_list_icon_comments"] forState:UIControlStateNormal];
        [self addSubview:comment_count];
        self.comment_count=comment_count;

         //评论下部描述
        UILabel *content=[[UILabel alloc]init];
        content.font=UIBoldFont(14);
        content.numberOfLines = 0;
        [self addSubview:content];
        self.content=content;

         //评论下部的配图信息
        UIImageView *photos=[[UIImageView alloc]init];
        [self addSubview:photos];
        self.photos=photos;
        
         //评论下部发布者名称
        UILabel *username=[[UILabel alloc]init];
        username.font=userNameFont;
        username.textColor=WZColor(176, 176, 176);
        [self addSubview:username];
        self.username=username;
        
         //评论时间
        UILabel *visit_count=[[UILabel alloc]init];
        visit_count.font=userNameFont;
        visit_count.textColor=WZColor(176, 176, 176);
        [self addSubview:visit_count];
        self.visit_count=visit_count;
        
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            WZCommentCell *cell = (WZCommentCell *)view;
            cell.backgroundColor = [UIColor whiteColor];
            cell.contentView.backgroundColor = [UIColor whiteColor];
            cell.content.textColor = [UIColor blackColor];
            cell.username.textColor = WZColor(176, 176, 176);
            cell.visit_count.textColor = WZColor(176, 176, 176);
        } nightMode:^(UIView *view) {
             WZCommentCell *cell = (WZCommentCell *)view;
            cell.backgroundColor = WZNightCellColor;
            cell.contentView.backgroundColor = WZNightCellColor;
            cell.content.textColor = WZNightTextColor;
            cell.username.textColor = WZNightTextColor;
            cell.visit_count.textColor = WZNightTextColor;
        }];

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
    frame.size.height -= WZBorder;
    [super setFrame:frame];
}
- (NSString *)rangKiloString:(int)count
{
    if (count>1000) {
        NSString *num=[NSString stringWithFormat:@"%dk",count/1000];
        return num;
    }else{
        NSString *num=[NSString stringWithFormat:@"%d",count];
        return num;
    }
  
}
@end
