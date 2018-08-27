//
//  JXLTableViewCell.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZTableViewCell.h"
#import "JXLDayAndNightMode.h"

@implementation WZTableViewCell

- (void)dealloc {
    NSLog(@"cell");
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        if (JXLDayAndNightModeDay == [[JXLDayAndNightManager shareManager] contentMode]) {
            switchView.on = NO;
        } else {
            switchView.on = YES;
        }
        self.accessoryView = switchView;
        [switchView addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged]; 
        
        //设置日间和夜间两种状态模式
        [self jxl_setDayMode:^(UIView *view) {
            WZTableViewCell *cell = (WZTableViewCell *)view;
            cell.backgroundColor = [UIColor whiteColor];
            cell.contentView.backgroundColor = [UIColor whiteColor];
            cell.textLabel.backgroundColor = [UIColor whiteColor];
            cell.textLabel.textColor = [UIColor blackColor];
        } nightMode:^(UIView *view) {
            WZTableViewCell *cell = (WZTableViewCell *)view;
            cell.backgroundColor = WZNightCellColor;
             cell.contentView.backgroundColor = WZNightCellColor;
            cell.textLabel.backgroundColor = WZNightCellColor;
            cell.textLabel.textColor = [UIColor whiteColor];
        }];

    }
    
    return self;
}

- (void)switchValueChange:(UISwitch *)switchView {
    if (switchView.on) {
        
        [[JXLDayAndNightManager shareManager] nightMode];
    } else {
        [[JXLDayAndNightManager shareManager] dayMode];
    }
}



@end
