//
//  QNKAPIClient.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "QNKAPIClient.h"
#import "QNKItem.h"

@interface QNKAPIClient ()
// TODO: Use priority queue for requests, like AFNetworking does.
@property (nonatomic, strong) NSURLConnection *itemsConnection;
@property (nonatomic, copy) QNKAPIClientFetchItemsSuccessBlock itemsSuccessBlock;
@property (nonatomic, copy) QNKAPIClientFailureBlock itemsFailureBlock;
@property (nonatomic, strong) NSMutableData *itemsResponseData;

@property (nonatomic, strong) NSURLConnection *imageConnection;
@property (nonatomic, copy) QNKAPIClientFetchImageSuccesBlock imageSuccessBlock;
@property (nonatomic, copy) QNKAPIClientFailureBlock imageFailureBlock;
@property (nonatomic, strong) NSMutableData *imageResponseData;
@end

@implementation QNKAPIClient

#pragma mark NSURLConnectionDelegate Protocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if ([connection isEqual:self.itemsConnection]) {
        self.itemsResponseData = [NSMutableData data];
    } else {
        self.imageResponseData = [NSMutableData data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    if ([connection isEqual:self.itemsConnection]) {
        [self.itemsResponseData appendData:data];
    } else {
        [self.imageResponseData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if ([connection isEqual:self.itemsConnection]) {
        NSError *error = nil;
        NSArray *itemsJSON = [NSJSONSerialization JSONObjectWithData:self.itemsResponseData
                                                             options:0
                                                               error:&error];
        if (error) {
            if (self.itemsFailureBlock) {
                self.itemsFailureBlock(error);
            }
        } else if (self.itemsSuccessBlock) {
            NSMutableArray *items = [NSMutableArray arrayWithCapacity:[itemsJSON count]];
            for (NSDictionary *itemJSON in itemsJSON) {
                [items addObject:[[QNKItem alloc] initWithDictionary:itemJSON]];
            }

            self.itemsSuccessBlock([items copy]);
        }
    } else {
        UIImage *image = [UIImage imageWithData:self.imageResponseData];
        if (self.imageSuccessBlock) {
            self.imageSuccessBlock(image);
        }
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if ([connection isEqual:self.imageConnection] && self.itemsFailureBlock) {
        self.itemsFailureBlock(error);
    } else if ([connection isEqual:self.imageConnection] && self.imageFailureBlock) {
        self.imageFailureBlock(error);
    }
}

#pragma mark - Public Interface

- (void)fetchItems:(QNKAPIClientFetchItemsSuccessBlock)success
           failure:(QNKAPIClientFailureBlock)failure {
    self.itemsSuccessBlock = success;
    self.itemsFailureBlock = failure;

    NSString *urlstring = [NSString stringWithFormat:@"http://qiita.com/api/v1/items/"];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.itemsConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)fetchImage:(NSURL *)imageURL
           success:(QNKAPIClientFetchImageSuccesBlock)success
           failure:(QNKAPIClientFailureBlock)failure {
    self.imageSuccessBlock = success;
    self.imageFailureBlock = failure;

    NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];
    self.imageConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

@end
