//
//  WZDrawerLeftModel.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface WZDrawerLeftModel : JSONModel

/**抽屉左侧标题的ID*/
@property(nonatomic,copy)NSString *filter_id;
/**抽屉左侧标题的uri*/
@property(nonatomic,copy)NSString *uri;
/**抽屉左侧标题的content_type*/
@property(nonatomic,copy)NSString *content_type;
/**抽屉左侧标题*/
@property(nonatomic,copy)NSString *title;

@end
