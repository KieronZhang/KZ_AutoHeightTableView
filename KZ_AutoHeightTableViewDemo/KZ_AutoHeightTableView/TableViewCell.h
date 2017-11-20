//
//  TableViewCell.h
//  KZ_AutoHeightTableView
//
//  Created by Kieron Zhang on 2017/10/16.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell {
    UIImageView *imageView;
    UILabel *titleLabel;
}
@property (nonatomic, strong) NSString *text;

+ (CGFloat)heightForText:(NSString *)text;

@end
