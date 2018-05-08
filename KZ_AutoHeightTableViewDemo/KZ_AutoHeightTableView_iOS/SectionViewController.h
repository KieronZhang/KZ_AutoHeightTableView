//
//  SectionViewController.h
//  KZ_AutoHeightTableView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView *mainTableView;
    NSMutableArray *itemArray;
}

@end
