//
//  QNKDetailView.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 3/1/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "QNKItemViewController.h"
#import "QNKAPIClient.h"
#import "UIViewController+QNKShowAlertView.h"

@interface QNKItemViewController ()
@property (nonatomic, strong) QNKItem *item;
@property (nonatomic, strong) QNKAPIClient *client;
@end

@implementation QNKItemViewController

#pragma mark - Object Lifecycle

- (instancetype)initWithItem:(QNKItem *)item {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _item = item;
        _client = [QNKAPIClient new];
    }
    return self;
}

#pragma mark - UIViewController Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.item.title;

    [self.userNameLabel setText:self.item.user.name];
    [self.postBodyWebView loadHTMLString:self.item.bodyHTML baseURL:nil];

    [self.client fetchImage:self.item.user.imageURL success:^(UIImage *image) {
        self.userImageView.image = image;
    } failure:^(NSError *error) {
        [self showAlertViewForError:error];
    }];
}

@end
