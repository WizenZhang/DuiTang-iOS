//
//  WZCategoryCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/19.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZCategoryCell.h"
#import "WZCategory.h"
#import "WZGroupItems.h"
#import "WZOrderButton.h"
#import "JXLDayAndNightMode.h"
@interface WZCategoryCell ()
/**画报的主分类目录*/
@property(nonatomic,weak)UILabel *main;
/**画报的次分类目录*/
@property(nonatomic,weak)WZOrderButton *firstBtn;
@property(nonatomic,weak)WZOrderButton *secondBtn;
@property(nonatomic,weak)WZOrderButton *thirdBtn;
@property(nonatomic,weak)WZOrderButton *fourthBtn;
@end
@implementation WZCategoryCell
#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"categorycell";
    WZCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WZCategoryCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];}
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        // 画报的主分类目录背景色
        UIImageView *bg=[[UIImageView alloc]init];
        UIColor *color=WZColor(arc4random()%266, arc4random()%266, arc4random()%266);
        bg.backgroundColor=color;
        bg.clipsToBounds=YES;
        bg.layer.cornerRadius=5;
        bg.alpha=0.4;
        bg.frame=CGRectMake(WZBorder, WZBorder, 100, 20);
        [self addSubview:bg];
        
        // 画报的主分类目录
        UILabel *main=[[UILabel alloc]init];
        main.textColor=[UIColor blackColor];
        main.textAlignment=NSTextAlignmentCenter;
        [main setFont:CategoryFont];
        main.frame=CGRectMake(WZBorder, WZBorder, 100, 20);
        [self addSubview:main];
        self.main=main;

        
        //分割线
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=color;
        line.frame=CGRectMake(2*WZBorder+100, WZBorder+10, DeviceWidth-100-3*WZBorder, 0.5);
        [self addSubview:line];
        
        //画报的次分类目录
        CGFloat btnW=DeviceWidth/2;
        CGFloat btnH=20;

        WZOrderButton *firstBtn=[[WZOrderButton alloc]init];
        [self setupChildBtn:firstBtn];
        firstBtn.frame=CGRectMake(0, WZBorder+40, btnW, btnH);
         self.firstBtn=firstBtn;
  
        WZOrderButton *secondBtn=[[WZOrderButton alloc]init];
        [self setupChildBtn:secondBtn];
        secondBtn.frame=CGRectMake(btnW, WZBorder+40, btnW, btnH);
        self.secondBtn=secondBtn;
        
        WZOrderButton *thirdBtn=[[WZOrderButton alloc]init];
        [self setupChildBtn:thirdBtn];
        thirdBtn.frame=CGRectMake(0, WZBorder*2+btnH+40, btnW, btnH);
        self.thirdBtn=thirdBtn;
        
        WZOrderButton *fourthBtn=[[WZOrderButton alloc]init];
        [self setupChildBtn:fourthBtn];
        fourthBtn.frame=CGRectMake(btnW, WZBorder*2+btnH+40, btnW, btnH);
        self.fourthBtn=fourthBtn;
        
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            self.backgroundColor=[UIColor whiteColor];
            [self setupChildBtnDayColor:self.firstBtn];
            [self setupChildBtnDayColor:self.secondBtn];
            [self setupChildBtnDayColor:self.thirdBtn];
            [self setupChildBtnDayColor:self.fourthBtn];
        } nightMode:^(UIView *view) {
            self.backgroundColor=WZNightCellColor;
            [self setupChildBtnNightColor:self.firstBtn];
            [self setupChildBtnNightColor:self.secondBtn];
            [self setupChildBtnNightColor:self.thirdBtn];
            [self setupChildBtnNightColor:self.fourthBtn];
            
        }];
        
       }
    return self;
 
}
- (void)setupChildBtnDayColor:(WZOrderButton *)childBtn
{
    [childBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [childBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
}- (void)setupChildBtnNightColor:(WZOrderButton *)childBtn
{
    [childBtn setTitleColor:WZNightTextColor forState:UIControlStateNormal];
    [childBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
}

- (void)setupChildBtn:(WZOrderButton *)childBtn
{
    childBtn.titleLabel.font=CategoryFont;
    [self addSubview:childBtn];
}
- (void)setCategory:(WZCategory *)category
{
    _category=category;
    self.main.text=_category.group_name;
    NSArray *array = _category.group_items;
    for (int j = 0; j< 4; j++) {
        WZGroupItems *items=array[j];
        switch (j) {
            case 0:
                [self setupOrderBtn:_firstBtn GroupItems:items];
                break;
            case 1:
                [self setupOrderBtn:_secondBtn GroupItems:items];
                break;
            case 2:
                [self setupOrderBtn:_thirdBtn GroupItems:items];
                break;
            case 3:
                [self setupOrderBtn:_fourthBtn GroupItems:items];
                break;
            default:
                break;
        }
    }
}

- (void)setupOrderBtn:(WZOrderButton *)childBtn GroupItems:(WZGroupItems *)items
{
    [childBtn setTitle:items.name forState:UIControlStateNormal];
    [childBtn setTintColor:[UIColor blackColor]];
    [childBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    //绑定跳转画报的ID
    childBtn.target=items.target;
}

-(void)onClick:(WZOrderButton *)orderBtn
{
    //截取ID字符串
    long location=[orderBtn.target rangeOfString:@"id="].location+3;
    self.target=[orderBtn.target substringFromIndex:location];
    self.theme=orderBtn.titleLabel.text;
    //通知代理
    if ([self.delegate respondsToSelector:@selector(cellOrderBtnClick:)]) {
        [self.delegate cellOrderBtnClick:self];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}


@end
