//
//  RowViewController.m
//  KZ_AutoHeightTableView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "RowViewController.h"
#import "TableViewCell.h"
#import "Utils.h"
#import <KZ_AutoHeightTableView_iOS/UITableView+KZ_AutoHeight.h>

@interface RowViewController ()

@end

@implementation RowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *insertRowItem = [[UIBarButtonItem alloc] initWithTitle:@"Insert" style:UIBarButtonItemStylePlain target:self action:@selector(insertRowItemTapped)];
    UIBarButtonItem *deleteRowItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteRowItemTapped)];
    UIBarButtonItem *reloadRowItem = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(reloadRowItemTapped)];
    UIBarButtonItem *moveRowItem = [[UIBarButtonItem alloc] initWithTitle:@"Move" style:UIBarButtonItemStylePlain target:self action:@selector(moveRowItemTapped)];
    self.navigationItem.rightBarButtonItems = @[insertRowItem, deleteRowItem, reloadRowItem, moveRowItem];
    
    itemArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 1; i++) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        for (int j = 0; j < 20; j++) {
            [array addObject:[Utils radomText]];
        }
        [itemArray addObject:array];
    }
    
    mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    [self.view addSubview:mainTableView];
}

- (void)insertRowItemTapped {
    NSMutableArray *array = itemArray[0];
    [array insertObject:[Utils radomText] atIndex:2];
    [array insertObject:[Utils radomText] atIndex:3];
    [mainTableView beginUpdates];
    [mainTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0], [NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [mainTableView endUpdates];
}

- (void)deleteRowItemTapped {
    NSMutableArray *array = itemArray[0];
    [array removeObjectAtIndex:3];
    [array removeObjectAtIndex:2];
    [mainTableView beginUpdates];
    [mainTableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0], [NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [mainTableView endUpdates];
}

- (void)reloadRowItemTapped {
    [mainTableView beginUpdates];
    [mainTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0], [NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [mainTableView endUpdates];
}

- (void)moveRowItemTapped {
    NSMutableArray *array = itemArray[0];
    id object = array[0];
    [array removeObjectAtIndex:0];
    [array insertObject:object atIndex:2];
    [mainTableView beginUpdates];
    [mainTableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] toIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    [mainTableView endUpdates];
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return itemArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = itemArray[section];
    return array.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSArray *array = itemArray[indexPath.section];
//    return [TableViewCell heightForText:array[indexPath.row]];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellName = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellName];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellName];
    }
    NSArray *array = itemArray[indexPath.section];
    cell.text = array[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
