//
//  ViewController.h
//  KZ_AutoHeightTableView
//
//  Created by Kieron Zhang on 2017/10/16.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView *mainTableView;
    NSMutableArray *itemArray;
}

@end

