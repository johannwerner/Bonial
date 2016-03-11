//
//  BrochureModel.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "BrochureModel.h"

@implementation BrochureModel

- (id)initWithDictionary:(NSDictionary *)attributes {
  self = [super init];
  if (self) {
    self.brochureTitle = attributes[@"title"];
    self.brochureCoverUrl = attributes[@"coverUrl"];
    self.brochureRetailerName = attributes[@"retailerName"];
  }
  return self;
}

@end
