//
//  WZHeadThemeDetail.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
#import "WZRelatedThemeGroup.h"
#import "WZData_src.h"
@interface WZHeadThemeDetail : JSONModel

/**分类主题描述*/
@property (nonatomic,copy) NSString *desc;
/**分类主题图片*/
@property (nonatomic,copy) NSString *image;
/**分类主题名字*/
@property (nonatomic,copy) NSString *name;
/**相关主题组*/
//@property (nonatomic,strong) NSArray<WZRelatedThemeGroup> *related_theme_group;
/**加载分类资源*/
@property (nonatomic,strong)WZData_src *data_src;

@end
