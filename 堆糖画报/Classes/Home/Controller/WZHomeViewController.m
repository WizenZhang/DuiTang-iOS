//
//  WZHomeViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZHomeViewController.h"
#import "AFNetworking.h"
#import "WZHomeHeadData.h"
#import "UIImageView+WebCache.h"
#import "WZHomeHeadView.h"

@interface WZHomeViewController ()
@property(nonatomic,strong)NSArray *statuses;
@end

@implementation WZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.加载主页顶部数据
    [self loadHomeTopData];
    
    //2.加载ScrollView
//    UIScrollView *scroll=[[UIScrollView alloc]init];
//    CGFloat scrollW=[UIScreen mainScreen].bounds.size.width;
//    scroll.frame=CGRectMake(0, 0, scrollW, 150);
//    scroll.backgroundColor=[UIColor redColor];
    self.tableView.tableHeaderView =[WZHomeHeadView headerView];
}
- (void)loadHomeTopData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.说明服务器返回的是Json数据
    //    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 3.发送请求
    [mgr GET:@"http://www.duitang.com/napi/ad/banner/week/?platform_version=4.1.2&device_platform=8295&screen_width=540&screen_height=960&app_version=57&platform_name=Android&locale=zh&adid=ANA001&app_code=nayutas" parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSArray *dictArray=responseObject[@"data"];
         NSMutableArray *dataArray=[NSMutableArray array];
         for (NSDictionary *dict in dictArray) {
             WZHomeHeadData *data=[WZHomeHeadData dataWithDict:dict];
             [dataArray addObject:data];
         }
         self.statuses=dataArray;
         [self.tableView reloadData];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"fail");
     }];
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.statuses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    WZHomeHeadData *status=self.statuses[indexPath.row];
    cell.textLabel.text=status.desc;
    
    cell.detailTextLabel.text=status.enabled_at_str;//    NSString *iconUrl=status.image_url;
//    NSData *imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:iconUrl]];
//    cell.imageView.image=[UIImage imageWithData:imageData];

    
    [cell.imageView setImageWithURL:[NSURL URLWithString:status.image_url]placeholderImage:[UIImage imageNamed:@"image_default"]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
