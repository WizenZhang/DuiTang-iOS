//
//  WZHttpRequestManager.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/13.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZHttpRequestManager.h"
#import "AFNetworking.h"
@implementation WZHttpRequestManager
-(id)initWithUrlString:(NSString *)url andBlock:(httpRequestBlock)block
{
    if (self = [super init]) {
        
        [self requestDataWithString:url andBlock:block];
        
    }
    return self;
}
- (void)requestDataWithString:(NSString *)url andBlock:(httpRequestBlock)tempBlock{
    
    //    [SVProgressHUD showWithStatus:@"正在刷新！" maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager  = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        //解析
        self.data = responseObject;
        
        tempBlock(self);
        
        //        [SVProgressHUD showSuccessWithStatus:@"OK!" maskType:SVProgressHUDMaskTypeBlack];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        
        NSLog(@"error:%@",error.localizedDescription);
    }];
    
}
@end

