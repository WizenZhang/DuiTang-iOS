//
//  DataCenter.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WZObjectLists;
typedef enum{
    kRecordTypeWithCollection = 1//收藏
    //    kRecordTypeWithDownload,//下载
    //    kRecordTypeWithAttention//关注
}RecordType;
@interface DataCenter : NSObject
//创建类方法,得到对象
+(DataCenter *)sharedCenter;

//1.增加数据
-(BOOL)addDataWithModel:(WZObjectLists *)model andType:(RecordType)type;
//2.删除数据
-(BOOL)deleteDataWithModel:(WZObjectLists *)model andType:(RecordType)type;
//3.查找数据
-(BOOL)findDataWithModel:(WZObjectLists *)model andType:(RecordType)type;
//4.取数据
-(NSArray *)getDataWithType:(RecordType)type;

@end
