//
//  QNKItemSpec.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "QNKItem.h"

SPEC_BEGIN(QNKItemSpec)

describe(@"QNKItem", ^{
    describe(@"-initWithDictionary:", ^{
        it(@"sets name and image URL", ^{
            QNKItem *item = [[QNKItem alloc] initWithDictionary:@{
                @"title": @"Qiita-kun no Toukou",
                @"body": @"<h1>Hello, world!</h1>"
            }];

            [[item.title should] equal:@"Qiita-kun no Toukou"];
            [[item.bodyHTML should] equal:@"<h1>Hello, world!</h1>"];
        });
    });
});

SPEC_END
