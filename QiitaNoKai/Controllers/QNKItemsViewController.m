//
//  QNKTitlesViewController.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/28/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "QNKItemsViewController.h"
#import "QNKItemViewController.h"
#import "QNKItemStore.h"
#import "QNKAPIClient.h"
#import "UIViewController+QNKShowAlertView.h"

@interface QNKItemsViewController ()
@property (nonatomic, strong) QNKItemStore *itemStore;
@end

@implementation QNKItemsViewController

#pragma mark - Object Lifecycle

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _itemStore = [[QNKItemStore alloc] initWithClient:[QNKAPIClient new]];
    }
    return self;
}

#pragma mark - UIViewController Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Qiita Recent Posts";
    [self initializeRefreshControl];
    self.tableView.dataSource = self.itemStore;
    [self refresh];
}

#pragma mark - Internal Methods

- (void)initializeRefreshControl {
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self
                       action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)refresh {
    [self.itemStore reloadItems:^{
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    } failure:^(NSError *error) {
        [self showAlertViewForError:error];
    }];
}

#pragma mark - UITableViewDelegate Protocol Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QNKItem *item = self.itemStore.items[indexPath.row];
    QNKItemViewController *detail = [[QNKItemViewController alloc] initWithItem:item];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
