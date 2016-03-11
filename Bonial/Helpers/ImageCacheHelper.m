//
//  ImageCacheHelper.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/10.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "API.h"
#import "ImageCacheHelper.h"

@interface ImageCacheHelper ()

@property(strong, nonatomic) NSMutableDictionary *imageCache;

@end

@implementation ImageCacheHelper

- (id)init {
  self = [super init];
  if (self) {
    self.imageCache = [@{} mutableCopy];
  }
  return self;
}

- (void)fetchImageFromUrl:(NSString *)urlString
                onDidLoad:(void (^)(UIImage *image))onImageDidLoad {
  UIImage *imageFromCache = self.imageCache[urlString];
  if (imageFromCache) {
    onImageDidLoad(imageFromCache);
  } else {
    [API fetchImageFromUrl:urlString
                 onDidLoad:^(UIImage *image) {
                   self.imageCache[urlString] = image;
                   onImageDidLoad(image);
                 }];
  }
}

@end
