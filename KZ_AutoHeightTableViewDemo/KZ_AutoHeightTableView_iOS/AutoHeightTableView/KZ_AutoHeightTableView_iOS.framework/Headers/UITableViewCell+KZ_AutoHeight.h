//
//  UITableViewCell+KZ_AutoHeight.h
//  KZ_AutoHeightTableView
//
//  Created by Kieron Zhang on 2017/10/18.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (KZ_AutoHeight)

@property (nonatomic, strong) NSArray *kz_bottomViews;
@property (nonatomic, assign) float kz_offset;

- (CGFloat)kz_heightForCell;

@end
