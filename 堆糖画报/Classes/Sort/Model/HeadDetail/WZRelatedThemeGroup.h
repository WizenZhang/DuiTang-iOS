//
//  WZRelatedThemeGroup.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
#import "WZRelateItems.h"
@protocol WZRelatedThemeGroup
@end
@interface WZRelatedThemeGroup : JSONModel
/**相关主题组名称*/
@property (nonatomic,copy) NSString *name;
/**相关主题items*/
@property (nonatomic,strong) NSArray<WZRelateItems> *items;
@end
