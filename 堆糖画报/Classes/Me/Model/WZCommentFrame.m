//
//  WZCommentFrame.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/30.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCommentFrame.h"
#import "WZCommentDownModel.h"
#import "WZPhoto.h"
#import "MJExtension.h"
@implementation WZCommentFrame
- (void)setObject_list:(WZCommentDownModel *)object_list
{
    _object_list=object_list;
    
    
    // 评论下部评论数目
    CGFloat commentW = 30;
    CGFloat commentX = 2*WZBorder;
    CGFloat commentY = 18;
    CGFloat commentH=30;
    _commentF=CGRectMake(commentX, commentY, commentW, commentH);
    
    //评论下部描述
    CGFloat contentW =cellW-commentW-6*WZBorder;
    CGFloat contentX = commentW+4*WZBorder;
    CGFloat contentY = 4*WZBorder;
    CGSize contentLabelSize = [_object_list.content sizeWithFont:MsgFont constrainedToSize:CGSizeMake(contentW, MAXFLOAT)];
    _contentF = (CGRect){{contentX, contentY},contentLabelSize};
    
    //评论下部的配图信息
    CGFloat photoX = commentW+4*WZBorder;
    CGFloat photoY = CGRectGetMaxY(_contentF)+2*WZBorder;
    CGFloat photoW =contentW;
    if (_object_list.photos[0]) {
        WZPhoto *photo=[WZPhoto objectWithKeyValues:_object_list.photos[0]];
        CGFloat ratio = photoW / photo.width;
        CGFloat photoH = photo.height  * ratio;
        _photosF = CGRectMake(photoX, photoY, photoW, photoH);
    }else{
        _photosF = CGRectMake(photoX, CGRectGetMaxY(_contentF),0, 0);
    }
    
    //评论下部发布者名称
    CGFloat usernameX = commentW+4*WZBorder;
    CGFloat usernameY = CGRectGetMaxY(_photosF)+WZBorder;
    CGFloat usernameW =250;
    CGFloat usernameH =30;
    _usernameF = CGRectMake(usernameX, usernameY, usernameW, usernameH);
    
    //评论下部评论浏览量 
    CGFloat visit_countX = cellW-2*WZBorder-100;
    CGFloat visit_countY = CGRectGetMaxY(_photosF)+WZBorder;
    CGFloat visit_countW =100;
    CGFloat visit_countH =30;
    _visit_countF = CGRectMake(visit_countX, visit_countY, visit_countW, visit_countH);

    /* cell的高度 */
    _cellH=CGRectGetMaxY(_visit_countF)+2*WZBorder;
    
}
@end
