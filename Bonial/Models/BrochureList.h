//
//  BrochureList.h
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "BrochureModel.h"
#import <Foundation/Foundation.h>

@interface BrochureList : NSObject

@property(strong, nonatomic) NSArray *brochuresArray;
@property(strong, nonatomic) NSString *brochureListName, *brochureListUrl;

- (id)initWithDictionary:(NSDictionary *)attributes;

@end
