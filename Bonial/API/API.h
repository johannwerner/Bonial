//
//  API.h
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SectorModel;

@interface API : NSObject

+ (void)fetchListWithBrochuresCompletion:(void (^)(SectorModel *response,
                                                   NSError *error))completion;

+ (void)fetchImageFromUrl:(NSString *)urlString
                onDidLoad:(void (^)(UIImage *image))onImageDidLoad;

@end
