//
//  BrochureList.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "BrochureList.h"

@implementation BrochureList

- (id)initWithDictionary:(NSDictionary *)attributes {
  self = [super init];
  if (self) {
    self.brochuresArray = attributes[@"brochures"];
    NSMutableArray *brochuresMutableArray = [@[] mutableCopy];
    for (NSDictionary *brochureDictionary in self.brochuresArray) {
      BrochureModel *brochureModel =
          [[BrochureModel alloc] initWithDictionary:brochureDictionary];
      [brochuresMutableArray addObject:brochureModel];
    }
    self.brochuresArray = [brochuresMutableArray copy];
    self.brochureListName = attributes[@"name"];
    self.brochureListUrl = attributes[@"url"];
  }
  return self;
}

@end
