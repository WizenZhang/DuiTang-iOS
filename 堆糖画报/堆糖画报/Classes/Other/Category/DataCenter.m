//
//  DataCenter.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "DataCenter.h"
#import "FMDatabase.h"
#import "WZObjectLists.h"
@interface DataCenter()
@property (nonatomic,strong)FMDatabase *database;
@end
@implementation DataCenter
//创建类方法,得到对象
//1.声明static类型的对象指针
static DataCenter *center = nil;
+(DataCenter *)sharedCenter{
    //2.同步处理(保证线程安全)
    @synchronized(self){
        //3.当没有对象时,创建新的对象
        if (!center) {
            center = [[DataCenter alloc]init];
        }
    }
    //4.将当前对象返回
    return center;
}

//重写allocWithZone:方法 当调用alloc创建对象时,会自动调用这个方法,重写它,可以保证创建对象的单一性
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self){
        if (!center) {
            center = [super allocWithZone:zone];
        }
    }
    return center;
}

-(id)init{
    if (self = [super init]) {
         //创建表格
        [self createDatabase];
    }
    return self;
}
-(void)createDatabase{
    
   
    //数据库的路径
    NSString *path = [NSString stringWithFormat:@"%@/Documents/data.sqlite",NSHomeDirectory()];
    
    //创建数据库
    self.database = [[FMDatabase alloc]initWithPath:path];
    
    if (self.database.open == NO) {
        NSLog(@"失败");

        return ;
    }
    
    //创建表的sql语句
    NSString *sql = @"create table if not exists applist ("
    //    " id integer primary key autoincrement not null,"
    " recordType varchar(32), "
    " msg varchar(1024), "
    " name varchar(128), "
    " path varchar(1024), "
    " avatar varchar(1024),"
    " username varchar(128) ,"
    " favorite_count integer, "
    " like_count integer, "
    " reply_count integer ,"
    " id varchar(128) "


    
    ");";
    
    BOOL isExecuteUpdate = [self.database executeUpdate:sql];
    NSLog(@"isExecuteUpdate=%d",isExecuteUpdate);
    [_database close];
}

//1.增加数据
-(BOOL)addDataWithModel:(WZObjectLists *)model andType:(RecordType)type{
    
    if (![_database open]) {
        
        return NO;
    }
    NSString *sql = @"insert into applist(recordType,msg,name,path,avatar,username,favorite_count,like_count,reply_count,id) values(?,?,?,?,?,?,?,?,?,?)";
    
    BOOL success = [self.database executeUpdate:sql,[NSString stringWithFormat:@"%i",type],model.msg,model.album.name,model.photo.path,model.sender.avatar,model.sender.username,model.favorite_count,model.like_count,model.reply_count,model.id];
    NSLog(@"增加数据success%d",success);
    return success;
    
}
//2.删除数据
-(BOOL)deleteDataWithModel:(WZObjectLists *)model andType:(RecordType)type{
    if (![_database open]) {
        
        return NO;
    }
    NSString *sql = @"delete from applist where id=? and recordType=?";
    
    BOOL success = [self.database executeUpdate:sql,model.id,[NSString stringWithFormat:@"%i",type]];
    NSLog(@"删除 %d",success);

    [_database close];
    
    return success;
    
}
//3.查找数据
-(BOOL)findDataWithModel:(WZObjectLists *)model andType:(RecordType)type{
    if (![_database open]) {
        
        return NO;
    }
    NSString *sql = @"select count(*) from applist where id=? and recordType=?";
    //注意：只有查找时，用的方法是executeQuery：其他的都用executeUpdate：
    //里面保存的是查找到的内容
    FMResultSet *set = [self.database executeQuery:sql,model.id,[NSString stringWithFormat:@"%i",type]];
    int count = 0;
    if ([set next]) {
        count = [set intForColumnIndex:0];
    }
    [_database close];
    return count;
    
}
//4.取数据
-(NSArray *)getDataWithType:(RecordType)type{
    if (![_database open]) {
        
        NSLog(@"打开失败！");
        
        return nil;
    }
    
    NSString *sql = @"select * from applist where recordType=?";
    
    FMResultSet *set = [self.database executeQuery:sql,[NSString stringWithFormat:@"%i",type]];
    
    //遍历结果集
    NSMutableArray *array = [NSMutableArray array];
    
    //遍历结果集，将数据库里面的相关数据取出放在数组中
    while ([set next]) {
        
        WZObjectLists *model = [[WZObjectLists alloc]init];
        
        model.msg=[set stringForColumn:@"msg"];
        model.favorite_count=[set stringForColumn:@"favorite_count"];
        model.reply_count=[set stringForColumn:@"reply_count"];
        model.like_count=[set stringForColumn:@"like_count"];
        model.id = [set stringForColumn:@"id"];
        model.sender = [[WZSender alloc]init];
        model.sender.username = [set stringForColumn:@"username"];
        model.sender.avatar = [set stringForColumn:@"avatar"];
        model.album = [[WZAlbum alloc]init];
        model.album.name = [set stringForColumn:@"name"];
        model.photo = [[WZPhoto alloc]init];
        model.photo.path = [set stringForColumn:@"path"];
//        model.photo.width = [set stringForColumn:@"width"];
//        model.photo.height = [set stringForColumn:@"height"];
        [array addObject:model];
        
    }
    [_database close];
   
    return array;
}

@end
