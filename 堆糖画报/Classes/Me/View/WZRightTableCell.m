//
//  WZRightTableCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/28.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZRightTableCell.h"
#import "WZDrawerRightModel.h"
#import "WZDrawerRightPhoto.h"
#import "UIImageView+WebCache.h"
#import "JXLDayAndNightMode.h"
@interface WZRightTableCell ()
/**club的配图*/
@property (nonatomic, weak) UIImageView *image;
/**club的名称*/
@property (nonatomic, weak) UILabel *name;
/**club的成员数*/
@property (nonatomic, weak) UILabel *member;
@end
@implementation WZRightTableCell
#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{   
    static NSString *ID = @"rightTableCell";
    WZRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WZRightTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //取消高亮变灰
        self.selectionStyle= UITableViewCellSelectionStyleNone;
        
        // club的配图
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(WZBorder,WZBorder, 70, 70);
        [self addSubview:image];
        self.image=image;
        
         // club的名称
        UILabel *name=[[UILabel alloc]init];
        name.font = NameFont;
        name.textColor=[UIColor blackColor];
        name.frame=CGRectMake(85, 10, 180, 30);
        [self addSubview:name];
        self.name=name;
        
        
        
         // club的成员数
        UILabel *member=[[UILabel alloc]init];
        member.font = MsgFont;
        [member setTextColor:[UIColor grayColor]];
        member.frame=CGRectMake(85, 40, 180, 30);
        [self addSubview:member];
        self.member=member;

        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            WZRightTableCell *cell=(WZRightTableCell *)view;
            cell.backgroundColor=[UIColor whiteColor];
            cell.contentView.backgroundColor = [UIColor whiteColor];
            cell.name.textColor=[UIColor blackColor];
            cell.member.textColor=[UIColor blackColor];
        } nightMode:^(UIView *view) {
            WZRightTableCell *cell=(WZRightTableCell *)view;
            cell.backgroundColor=WZNightCellColor;
            cell.contentView.backgroundColor = WZNightCellColor;
            cell.name.textColor=WZNightTextColor;
            cell.member.textColor=WZNightTextColor;
        }];
    }
    return self;
}

- (void)setObject_list:(WZDrawerRightModel *)object_list
{
    _object_list=object_list;
    WZDrawerRightPhoto *photo=_object_list.photo;
    
    //club的配图
    [_image setImageWithURL:[NSURL URLWithString:photo.path]placeholderImage:[UIImage imageNamed:@"image_default"]];
    
    //club的名称
    _name.text=_object_list.name;
    
    //club的成员数
    NSString *count=[NSString stringWithFormat:@"%d",_object_list.member_count];
    _member.text=count;
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


@end
