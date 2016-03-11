//
//  BrochureModel.h
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrochureModel : NSObject

@property(strong, nonatomic) NSString *brochureCoverUrl, *brochureTitle,
    *brochureRetailerName;

- (id)initWithDictionary:(NSDictionary *)attributes;

@end
