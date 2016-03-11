//
//  API.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "API.h"
#import "SectorModel.h"

@implementation API

+ (void)fetchListWithBrochuresCompletion:(void (^)(SectorModel *response,
                                                   NSError *error))completion {
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  NSString *endpoint = [NSString
      stringWithFormat:@"%@%@", BonialAPIBaseURL, @"/coding_task/api.json"];
  [request setURL:[NSURL URLWithString:endpoint]];
  [request setHTTPMethod:@"GET"];
  [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

  NSURLSession *session =
      [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration
                                                 defaultSessionConfiguration]];

  [[session dataTaskWithRequest:request
              completionHandler:^(NSData *data, NSURLResponse *response,
                                  NSError *error) {
                if (data != nil) {
                  NSDictionary *responseDictionary =
                      [NSJSONSerialization JSONObjectWithData:data
                                                      options:kNilOptions
                                                        error:&error];
                  dispatch_async(dispatch_get_main_queue(), ^{
                    SectorModel *sectorModel = [[SectorModel alloc]
                        initWithArray:responseDictionary[@"sectors"]];
                    completion(sectorModel, error);
                  });
                } else {
                  dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil, error);
                  });
                }
              }] resume];
}

+ (void)fetchImageFromUrl:(NSString *)urlString
                onDidLoad:(void (^)(UIImage *image))onImageDidLoad {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                 ^(void) {
                   NSURL *imageURL = [NSURL URLWithString:urlString];
                   NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                   UIImage *image = [UIImage imageWithData:imageData];
                   dispatch_async(dispatch_get_main_queue(), ^(void) {
                     onImageDidLoad(image);
                   });
                 });
}

@end
