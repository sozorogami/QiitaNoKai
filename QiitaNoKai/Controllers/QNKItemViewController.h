//
//  QNKDetailView.h
//  QiitaNoKai
//
//  Created by Tyler Tape on 3/1/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QNKItem.h"

@interface QNKItemViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *userImageView;
@property (nonatomic, weak) IBOutlet UIWebView *postBodyWebView;

- (instancetype)initWithItem:(QNKItem *)item;

@end
