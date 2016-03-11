//
//  DisplayUnitsString.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/10.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "DisplayItemsString.h"

@implementation DisplayItemsString

+ (NSString *)stringForItemCount:(NSInteger)count {
  return [NSString
      localizedStringWithFormat:NSLocalizedString(@"%ld items", nil), count];
}

@end
