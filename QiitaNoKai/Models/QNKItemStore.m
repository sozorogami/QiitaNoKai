//
//  QNKItemStore.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "QNKItemStore.h"
#import "QNKAPIClient.h"

@interface QNKItemStore ()
@property (nonatomic, strong) QNKAPIClient *client;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) QNKItemStoreSuccessBlock successBlock;
@property (nonatomic, copy) QNKItemStoreFailureBlock failureBlock;
@end

@implementation QNKItemStore

#pragma mark - Object Lifecycle

- (instancetype)initWithClient:(QNKAPIClient *)client {
    self = [super init];
    if (self) {
        _client = client;
    }
    return self;
}

#pragma mark - UITableViewDataSource Protocol Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:@"TitleCell"];
    QNKItem *item = self.items[indexPath.row];
    cell.textLabel.text = item.title;

    return cell;
}

#pragma mark - Public Interface

- (void)reloadItems:(QNKItemStoreSuccessBlock)successBlock
            failure:(QNKItemStoreFailureBlock)failureBlock {
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    [self.client fetchItems:^(NSArray *items) {
        self.items = items;
        if (self.successBlock) {
            self.successBlock();
        }
    } failure:failureBlock];
}

@end
