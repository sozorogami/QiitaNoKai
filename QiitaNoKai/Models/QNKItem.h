//
//  QNKItem.h
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QNKUser.h"

@interface QNKItem : NSObject

@property (nonatomic, strong, readonly) QNKUser *user;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *bodyHTML;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
