//
//  ViewController.m
//  KZ_AutoHeightTableView
//
//  Created by Kieron Zhang on 2017/10/16.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import "SectionViewController.h"
#import "RowViewController.h"
#import "TableViewCell.h"
#import "Utils.h"
#import <KZ_AutoHeightTableViewFramework/UITableView+KZ_AutoHeight.h>
#import <KZ_MacroDefinitionFramework/KZ_MacroDefinition.h>
#import <KZ_FPSLabelFramework/KZ_FPSLabel.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [KZ_FPSLabel showFPSLabelWithView:[UIApplication sharedApplication].keyWindow center:CGPointMake(KZ_SCREEN_WIDTH - 50, KZ_SCREEN_HEIGHT - 50)];
    
    UIBarButtonItem *reloadItem = [[UIBarButtonItem alloc] initWithTitle:@"ReloadData" style:UIBarButtonItemStylePlain target:self action:@selector(reloadItemTapped)];
    UIBarButtonItem *sectionItem = [[UIBarButtonItem alloc] initWithTitle:@"Section" style:UIBarButtonItemStylePlain target:self action:@selector(sectionItemTapped)];
    UIBarButtonItem *rowItem = [[UIBarButtonItem alloc] initWithTitle:@"Row" style:UIBarButtonItemStylePlain target:self action:@selector(rowItemTapped)];
    self.navigationItem.leftBarButtonItem = reloadItem;
    self.navigationItem.rightBarButtonItems = @[sectionItem, rowItem];
    
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

- (void)reloadItemTapped {
    [mainTableView reloadData];
}

- (void)sectionItemTapped {
    SectionViewController *sectionViewController = [[SectionViewController alloc] init];
    [self.navigationController pushViewController:sectionViewController animated:YES];
}

- (void)rowItemTapped {
    RowViewController *rowViewController = [[RowViewController alloc] init];
    [self.navigationController pushViewController:rowViewController animated:YES];
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
