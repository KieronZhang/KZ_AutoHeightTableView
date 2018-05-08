//
//  TableViewCell.h
//  KZ_AutoHeightTableView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell {
    UIImageView *imageView;
    UILabel *titleLabel;
}
@property (nonatomic, strong) NSString *text;

+ (CGFloat)heightForText:(NSString *)text;

@end
