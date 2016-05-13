//
//  WZSender.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface WZSender : JSONModel
/**
 *  画报的发布者头像
 */
@property (nonatomic, copy) NSString *avatar;
/**
 *  画报的发布者昵称
 */
@property (nonatomic, copy) NSString *username;

@end
