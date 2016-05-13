//
//  WZUser.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/13.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"

@interface WZUser : JSONModel
/**
 *  画报的用户头像
 */
@property (nonatomic, copy) NSString *avatar;
/**
 *  画报的用户名
 */
@property (nonatomic, copy) NSString *username;
@end
