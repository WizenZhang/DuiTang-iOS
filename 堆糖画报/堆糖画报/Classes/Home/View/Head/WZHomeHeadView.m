//
//  WZHomeHeadView.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/4.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZHomeHeadView.h"
#import "WZHomeHeadData.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "NSYearToWeek+WZ.h"
#import "WZHomeHeadData.h"
#import "JXLDayAndNightMode.h"
@interface WZHomeHeadView ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)biserialClick;
- (IBAction)singleClick;

@property(nonatomic,strong)NSArray *statuses;
@property (strong, nonatomic) NSTimer *timer;
@property(nonatomic,strong)WZHomeHeadData *homeHeadData;

@end
@implementation WZHomeHeadView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WZHomeHeadView" owner:nil options:nil] lastObject];
    //    headerView.scrollView
}
- (void)loadHomeHeadData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.说明服务器返回的是Json数据
    //    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 3.发送请求
    [mgr GET:BANNER_URL parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSArray *dictArray=responseObject[@"data"];
         NSMutableArray *dataArray=[NSMutableArray array];
         for (NSDictionary *dict in dictArray) {
             WZHomeHeadData *data=[WZHomeHeadData dataWithDict:dict];
             [dataArray addObject:data];
         }
         self.statuses=dataArray;
         //设置图片
         [self setheadImage];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"fail");
     }];
    
}
- (void)setheadImage
{
    // 1.添加图片
    CGFloat imageW = self.scrollView.frame.size.width;
    CGFloat imageH = self.scrollView.frame.size.height;
    CGFloat imageY = 0;
    for (int index = 0; index < self.statuses.count; index++) {
        CGFloat imageX = index * imageW;
        //取得数据模型
        WZHomeHeadData *status=self.statuses[index];
        
        //添加头部图片
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag=index;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        [imageView setImageWithURL:[NSURL URLWithString:status.image_url]placeholderImage:[UIImage imageNamed:@"image_default"]];
        [self.scrollView addSubview:imageView];
        
        //添加描述标签
        UILabel *desc=[[UILabel alloc]init];
        [self setupChildLabel:desc text:status.desc textColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:20]];
        desc.frame=CGRectMake(imageX+10, 150, 300, 40);

        [self.scrollView addSubview:desc];
        //添加星期
        UILabel *enabled_at_str=[[UILabel alloc]init];
        NSString *text=[NSYearToWeek_WZ yearToWeek:status.enabled_at_str];
        [self setupChildLabel:enabled_at_str text:text textColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:20]];
        enabled_at_str.frame=CGRectMake(imageX+10, 130, 300, 40);
        
        [self.scrollView addSubview:enabled_at_str];
    }
    // 2.设置内容尺寸
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(imageW *  self.statuses.count, 0);
    self.scrollView.pagingEnabled = YES;
    
    // 3.分页
    self.pageControl.numberOfPages = self.statuses.count;
    
    // 4.定时器
    self.timer = [NSTimer timerWithTimeInterval:2.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userDetail:)];
    [self.scrollView addGestureRecognizer:tap];
    

}

- (void)userDetail:(UITapGestureRecognizer *)tap{

    //通知代理
    if ([self.delegate respondsToSelector:@selector(homeHeadViewClickImage:)]) {
        [self.delegate homeHeadViewClickImage:self];
    }
}

- (void)setupChildLabel:(UILabel *)label text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
    label.text=text;
    label.textColor=textColor;
    label.font=font;
}
- (void)nextImage
{
    // 0.获取跳转目标画报ID
    long index=self.pageControl.currentPage+1;
    if (index>self.statuses.count-1) {
        index=0;
    }
    self.homeHeadData=_statuses[index];
    NSString *source=[NSString stringWithFormat:@"%@",self.homeHeadData.target];
    long length = [source rangeOfString:@"id="].location+3;
    self.ID=[source substringFromIndex:length];
    
    // 1.下一页
    if (self.pageControl.currentPage == self.statuses.count - 1) {
        self.pageControl.currentPage = 0;
    } else {
        self.pageControl.currentPage++;
    }
    
    // 2.设置滚动
    CGPoint offset = CGPointMake(self.scrollView.frame.size.width * self.pageControl.currentPage, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.timer = [NSTimer timerWithTimeInterval:2.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.timer) return;
    self.pageControl.currentPage = (scrollView.contentOffset.x + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
}
/**
 *  当一个对象从xib中创建初始化完毕的时候就会调用一次
 */
- (void)awakeFromNib
{
    // 加载首页头部图片
    [self setDayAndNight];
    [self loadHomeHeadData];
}
/**
 *  设置日间和夜间两种状态模式
 */
- (void)setDayAndNight
{
    [self jxl_setDayMode:^(UIView *view) {
        // 设置夜间模式状态
        self.singleButton.backgroundColor = [UIColor whiteColor];
        self.biserialButton.backgroundColor = [UIColor whiteColor];
        self.backgroundColor=[UIColor whiteColor];

    } nightMode:^(UIView *view) {
        // 设置夜间模式状态
        self.backgroundColor=WZNightCellColor;
        self.singleButton.backgroundColor = WZNightCellColor;
        self.biserialButton.backgroundColor = WZNightCellColor;
    }];
}

- (IBAction)biserialClick {
        //通知代理
    if ([self.delegate respondsToSelector:@selector(homeHeadViewClickBiserial:)]) {
        [self.delegate homeHeadViewClickBiserial:self];
    }

}

- (IBAction)singleClick {
   
    //通知代理
    if ([self.delegate respondsToSelector:@selector(homeHeadViewClickSingle:)]) {
        [self.delegate homeHeadViewClickSingle:self];
    }

}
@end

