//
//  SectorModel.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "SectorModel.h"

@interface SectorModel ()

@property(strong, nonatomic) NSMutableArray *brochureListMutableArray;

@end

@implementation SectorModel

- (id)initWithArray:(NSArray *)array {
  self = [super init];
  if (self) {
    self.brochureListMutableArray = [@[] mutableCopy];
    for (NSDictionary *dictionary in array) {
      BrochureList *brochureList =
          [[BrochureList alloc] initWithDictionary:dictionary];
      [self.brochureListMutableArray addObject:brochureList];
    }
    self.brochureListArray = [self.brochureListMutableArray copy];
  }
  return self;
}

@end
