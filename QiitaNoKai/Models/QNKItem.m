//
//  QNKItem.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "QNKItem.h"

@implementation QNKItem

#pragma mark - Object Lifecycle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _user = [[QNKUser alloc] initWithDictionary:dictionary[@"user"]];
        _title = dictionary[@"title"];
        _bodyHTML = dictionary[@"body"];
    }
    return self;
}

@end
