//
//  BrochureViewModel.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "API.h"
#import "BrochureViewModel.h"
#import "SectorModel.h"

@implementation BrochureViewModel

- (void)fetchListCompletion:(void (^)(SectorModel *sectorModel,
                                      NSError *error))completion {
  [API fetchListWithBrochuresCompletion:^(SectorModel *sectorModel,
                                          NSError *error) {
    self.sectorModel = sectorModel;
    completion(sectorModel, error);
  }];
}

@end
