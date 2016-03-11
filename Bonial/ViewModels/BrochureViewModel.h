//
//  BrochureViewModel.h
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SectorModel;

@interface BrochureViewModel : NSObject

@property(strong, nonatomic) SectorModel *sectorModel;
@property(strong, nonatomic) NSArray *imageArray;

- (void)fetchListCompletion:(void (^)(SectorModel *response,
                                      NSError *error))completion;

@end
