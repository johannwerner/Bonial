//
//  SectorModel.h
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "BrochureList.h"
#import <Foundation/Foundation.h>

@interface SectorModel : NSObject

@property(strong, nonatomic) NSArray *brochureListArray;

- (id)initWithArray:(NSArray *)array;

@end
