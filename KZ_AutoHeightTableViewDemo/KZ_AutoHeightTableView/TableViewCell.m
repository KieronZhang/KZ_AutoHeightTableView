//
//  TableViewCell.m
//  KZ_AutoHeightTableView
//
//  Created by Kieron Zhang on 2017/10/16.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "TableViewCell.h"
#import <KZ_AutoHeightTableViewFramework/UITableViewCell+KZ_AutoHeight.h>
#import <KZ_MacroDefinitionFramework/KZ_MacroDefinition.h>
#import <KZ_CategoriesFramework/NSString+KZ_Size.h>
#import <KZ_CategoriesFramework/UIView+KZ_Frame.h>

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        imageView.image = [UIImage imageNamed:@"Logo"];
        [self.contentView addSubview:imageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.maxX + 10, 10, KZ_SCREEN_WIDTH - imageView.maxX - 20, 20)];
        titleLabel.numberOfLines = 0;
        titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [self.contentView addSubview:titleLabel];
        
        self.kz_bottomViews = @[imageView, titleLabel];
        self.kz_offset = 10;
    }
    return self;
}

- (void)setText:(NSString *)text {
    _text = text;
    titleLabel.text = text;
    CGSize titleSize = [text kz_sizeWithFont:titleLabel.font constrainedToWidth:titleLabel.width];
    titleLabel.height = titleSize.height;
}

+ (CGFloat)heightForText:(NSString *)text {
    CGSize titleSize = [text kz_sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToWidth:KZ_SCREEN_WIDTH - 90];
    return MAX(80, titleSize.height + 20);
}

@end
