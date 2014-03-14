//
//  QNKUserSpec.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "QNKUser.h"

SPEC_BEGIN(QNKUserSpec)

describe(@"QNKUser", ^{
    describe(@"-initWithDictionary:", ^{
        it(@"sets name and image URL", ^{
            NSString *googleURLString = @"http://www.google.com";
            QNKUser *user = [[QNKUser alloc] initWithDictionary:@{
                @"url_name": @"Qiita-kun",
                @"profile_image_url": googleURLString
            }];

            [[user.name should] equal:@"Qiita-kun"];
            [[user.imageURL should] equal:[NSURL URLWithString:googleURLString]];
        });
    });
});

SPEC_END
