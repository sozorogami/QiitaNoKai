//
//  QNKUser.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "QNKUser.h"

@implementation QNKUser

#pragma mark - Object Lifecycle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"url_name"];
        _imageURL = [NSURL URLWithString:dictionary[@"profile_image_url"]];
    }
    return self;
}

@end
