//
//  AppDelegate.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "WZTabBarController.h"
#import "WZUserDetailController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "APService.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //2.设置根控制器
    self.window.rootViewController = [[WZTabBarController alloc] init];
    
    [self addUM];
    
    [self addPushNotificationAndOptions:launchOptions];

    //3.显示Window
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)addUM{
    
    [UMSocialData setAppKey:@"55def769e0f55ae678001c81"];
    
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    
    
}
- (void)addPushNotificationAndOptions:(NSDictionary *)launchOptions{
    
    /*
     1.导入推送的SDK
     2.导入系统支持的多个相关框架
     3.设置apikey
     //注意:.plist文件的名字必须是PushConfig.plist
     4.设置可接受的信息样式
     5.接受通知
     */
    
    //4.设置可接受的信息样式
    //UIUserNotificationTypeAlert:iOS8.0之后使用
    [APService registerForRemoteNotificationTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
    
    [APService setupWithOption:launchOptions];
    
    
}
//推送的代理方法

//将设备的token发送给苹果推送服务器
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    //token:设备的唯一标识,是一个二进制的文件
    [APService registerDeviceToken:deviceToken];
    
    NSLog(@"My token is: %@", deviceToken);
}

//接受推送内容
//*******
//-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler{
//
//}
//基本的推送接受数据的方法
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    //userInfo:就是我们接受到的信息
    [APService handleRemoteNotification:userInfo];
}

//********
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

//推送出错是调用
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"error:%@",error.localizedDescription);
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
