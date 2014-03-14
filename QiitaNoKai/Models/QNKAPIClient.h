//
//  QNKAPIClient.h
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^QNKAPIClientFetchItemsSuccessBlock)(NSArray *items);
typedef void (^QNKAPIClientFetchImageSuccesBlock)(UIImage *image);
typedef void (^QNKAPIClientFailureBlock)(NSError *error);

@interface QNKAPIClient : NSObject

- (void)fetchItems:(QNKAPIClientFetchItemsSuccessBlock)success
           failure:(QNKAPIClientFailureBlock)failure;

- (void)fetchImage:(NSURL *)imageURL
           success:(QNKAPIClientFetchImageSuccesBlock)success
           failure:(QNKAPIClientFailureBlock)failure;

@end
