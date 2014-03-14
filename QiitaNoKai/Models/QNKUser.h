//
//  QNKUser.h
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QNKUser : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSURL *imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
