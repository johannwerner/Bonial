//
//  UIViewController+Alerts.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "UIViewController+Alerts.h"

@implementation UIViewController (Alerts)

- (void)displayAlertWithMessage:(NSString *)message {
  if (NSClassFromString(@"UIAlertController")) { // UIAlertController is only
                                                 // available from ios 8
    UIAlertController *alertController = [UIAlertController
        alertControllerWithTitle:NSLocalizedString(@"app_name", nil)
                         message:message
                  preferredStyle:UIAlertControllerStyleAlert];
    [alertController
        addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK")
                                           style:UIAlertActionStyleCancel
                                         handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
  }
}

@end
