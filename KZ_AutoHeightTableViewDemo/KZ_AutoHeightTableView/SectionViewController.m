//
//  SectionViewController.m
//  KZ_AutoHeightTableView
//
//  Created by Kieron Zhang on 2017/10/16.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "SectionViewController.h"
#import "TableViewCell.h"
#import "Utils.h"
#import <KZ_AutoHeightTableViewFramework/UITableView+KZ_AutoHeight.h>

@interface SectionViewController ()

@end

@implementation SectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *insertSectionItem = [[UIBarButtonItem alloc] initWithTitle:@"Insert" style:UIBarButtonItemStylePlain target:self action:@selector(insertSectionItemTapped)];
    UIBarButtonItem *deleteSectionItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteSectionItemTapped)];
    UIBarButtonItem *reloadSectionItem = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(reloadSectionItemTapped)];
    UIBarButtonItem *moveSectionItem = [[UIBarButtonItem alloc] initWithTitle:@"Move" style:UIBarButtonItemStylePlain target:self action:@selector(moveSectionItemTapped)];
    self.navigationItem.rightBarButtonItems = @[insertSectionItem, deleteSectionItem, reloadSectionItem, moveSectionItem];
    
    itemArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 2; i++) {
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

- (void)insertSectionItemTapped {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 20; i++) {
        [array addObject:[Utils radomText]];
    }
    [itemArray insertObject:array atIndex:0];
    [mainTableView beginUpdates];
    [mainTableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    [mainTableView endUpdates];
}

- (void)deleteSectionItemTapped {
    if (itemArray.count <= 1) {
        return;
    }
    [itemArray removeObjectAtIndex:0];
    [mainTableView beginUpdates];
    [mainTableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    [mainTableView endUpdates];
}

- (void)reloadSectionItemTapped {
    [mainTableView beginUpdates];
    [mainTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    [mainTableView endUpdates];
}

- (void)moveSectionItemTapped {
    if (itemArray.count <= 1) {
        return;
    }
    NSArray *array = itemArray[0];
    [itemArray removeObject:array];
    [itemArray insertObject:array atIndex:1];
    [mainTableView beginUpdates];
    [mainTableView moveSection:0 toSection:1];
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
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
