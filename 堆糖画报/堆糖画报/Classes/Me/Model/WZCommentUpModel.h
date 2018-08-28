//
//  WZCommentUpModel.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/30.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
@class WZDrawerRightPhoto;
@interface WZCommentUpModel : JSONModel
/**评论上部标题*/
@property(nonatomic,copy)NSString *name;
/**评论上部描述*/
@property(nonatomic,copy)NSString *desc;
/**评论上部成员数目*/
@property(nonatomic,assign)int member_count;
/**评论上部图片*/
@property(nonatomic,strong)WZDrawerRightPhoto *photo;
@end
