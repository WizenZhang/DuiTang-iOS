//
//  WZHttpRequestManager.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/13.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WZHttpRequestManager;

typedef void(^httpRequestBlock)(WZHttpRequestManager *manager);
@interface WZHttpRequestManager : NSObject
@property (nonatomic,strong) NSData *data;

- (id)initWithUrlString:(NSString *)url andBlock:(httpRequestBlock)block;
@end
