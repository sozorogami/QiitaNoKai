//
//  UIViewController+QNKShowAlertView.m
//  QiitaNoKai
//
//  Created by Tyler Tape on 2/27/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "UIViewController+QNKShowAlertView.h"

@implementation UIViewController (QNKShowAlertView)

#pragma mark - Public Interface

- (void)showAlertViewForError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
