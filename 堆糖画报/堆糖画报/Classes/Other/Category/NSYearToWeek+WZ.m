//
//  NSYearToWeek+WZ.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/4.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "NSYearToWeek+WZ.h"

@implementation NSYearToWeek_WZ
+(NSString *)yearToWeek:(NSString *)year
{
    
    NSString *string = year;
    
    NSRange range = [string rangeOfString:@":" options:NSBackwardsSearch];
    
    [string substringWithRange:range];
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate* inputDate = [inputFormatter dateFromString:string];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:inputDate];
    
    NSInteger week = [comps weekday];
    
    return [self getweek:week];
}
+(NSString *)getweek:(NSInteger)week

{
    NSString*weekStr=nil;
    switch (week) {
        case 1:
            weekStr=@"星期天";
            break;
        case 2:
            weekStr=@"星期一";
            break;
        case 3:
            weekStr=@"星期三";
            break;
        case 4:
            weekStr=@"星期四";
            break;
        case 5:
            weekStr=@"星期四";
            break;
        case 6:
            weekStr=@"星期五";
            break;
        case 7:
            weekStr=@"星期六";
            break;
        default:
            break;
    }
    return weekStr;
    
}
@end
