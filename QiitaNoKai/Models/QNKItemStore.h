//
//  QNKItemStore.h
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QNKItem.h"

@class QNKAPIClient;

typedef void (^QNKItemStoreSuccessBlock)(void);
typedef void (^QNKItemStoreFailureBlock)(NSError *error);

@interface QNKItemStore : NSObject <UITableViewDataSource>

@property (nonatomic, strong, readonly) NSArray *items;

- (instancetype)initWithClient:(QNKAPIClient *)client;

- (void)reloadItems:(QNKItemStoreSuccessBlock)successBlock
            failure:(QNKItemStoreFailureBlock)failureBlock;

@end
