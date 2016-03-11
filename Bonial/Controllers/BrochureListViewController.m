//
//  ViewController.m
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import "BrochureCollectionViewCell.h"
#import "BrochureListViewController.h"
#import "BrochureSectionHeaderCollectionReusableView.h"
#import "BrochureViewModel.h"
#import "DisplayItemsString.h"
#import "ImageCacheHelper.h"
#import "SectorModel.h"
#import "UIViewController+Alerts.h"

@interface BrochureListViewController () <UICollectionViewDataSource,
                                          UICollectionViewDelegate>

@property(weak, nonatomic) IBOutlet UIView *statusBarView;
@property(weak, nonatomic) IBOutlet UICollectionView *brochureCollectionView;
@property(weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property(strong, nonatomic) BrochureViewModel *brochureViewModel;
@property(strong, nonatomic) ImageCacheHelper *imageCacheHelper;

@end

@implementation BrochureListViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.statusBarView.backgroundColor = [Colors mainThemeColor];
  self.activityIndicator.color = [Colors mainThemeColor];

  self.brochureCollectionView.backgroundColor = [Colors mainBackgroundColor];

  self.brochureViewModel = [[BrochureViewModel alloc] init];

  self.brochureCollectionView.dataSource = self;
  self.brochureCollectionView.delegate = self;

  self.imageCacheHelper = [[ImageCacheHelper alloc] init];
  [self.activityIndicator startAnimating];
  [self.brochureViewModel
      fetchListCompletion:^(SectorModel *sectorModel, NSError *error) {
        [self.activityIndicator stopAnimating];
        if (!error) {
          [self.brochureCollectionView reloadData];
        } else {
          [self displayAlertWithMessage:error.localizedDescription];
        }
      }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:
    (UICollectionView *)collectionView {
  return self.brochureViewModel.sectorModel.brochureListArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  BrochureList *brochureList =
      self.brochureViewModel.sectorModel.brochureListArray[section];
  return brochureList.brochuresArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  BrochureCollectionViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:@"BrochureListCell"
                                                forIndexPath:indexPath];
  BrochureList *brochureList =
      self.brochureViewModel.sectorModel.brochureListArray[indexPath.section];
  BrochureModel *brochureModel = brochureList.brochuresArray[indexPath.row];
  cell.titleLabel.text = brochureModel.brochureTitle;
  cell.subTitleLabel.text = brochureModel.brochureRetailerName;
  cell.imageView.image = [UIImage imageNamed:@"placeholder"];
  [self.imageCacheHelper fetchImageFromUrl:brochureModel.brochureCoverUrl
                                 onDidLoad:^(UIImage *image) {
                                   cell.imageView.image = image;
                                 }];
  return cell;
}

#pragma mark - UICollectionViewDelegate

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
  BrochureSectionHeaderCollectionReusableView *header = [collectionView
      dequeueReusableSupplementaryViewOfKind:
          UICollectionElementKindSectionHeader
                         withReuseIdentifier:@"BrochuresListHeader"
                                forIndexPath:indexPath];
  BrochureList *brochureList =
      self.brochureViewModel.sectorModel.brochureListArray[indexPath.section];
  header.titleLabel.text = brochureList.brochureListName;
  header.subTitleLabel.text =
      [DisplayItemsString stringForItemCount:brochureList.brochuresArray.count];

  header.imageView.image = [UIImage imageNamed:@"placeholder"];
  [self.imageCacheHelper fetchImageFromUrl:brochureList.brochureListUrl
                                 onDidLoad:^(UIImage *image) {
                                   header.imageView.image = image;
                                 }];
  return header;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(collectionView.frame.size.width, 120);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                             layout:
                                 (UICollectionViewLayout *)collectionViewLayout
    referenceSizeForHeaderInSection:(NSInteger)section {
  return CGSizeMake(collectionView.frame.size.width, 70);
}

@end
