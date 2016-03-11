//
//  ImageCacheHelper.h
//  Bonial
//
//  Created by Johann Werner on 2016/03/10.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCacheHelper : NSObject

- (void)fetchImageFromUrl:(NSString *)urlString
                onDidLoad:(void (^)(UIImage *image))onImageDidLoad;

@end
