//
//  QNKItemStoreSpec.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "QNKItemStore.h"
#import "QNKAPIClient.h"

SPEC_BEGIN(QNKItemStoreSpec)

describe(@"QNKItemStore", ^{
    describe(@"-reloadItems:failure:", ^{
        it(@"requests items from the API client", ^{
            QNKAPIClient *client = [QNKAPIClient mock];
            [[client should] receive:@selector(fetchItems:failure:)];

            QNKItemStore *itemStore = [[QNKItemStore alloc] initWithClient:client];
            [itemStore reloadItems:nil failure:nil];
        });
    });
});

SPEC_END
