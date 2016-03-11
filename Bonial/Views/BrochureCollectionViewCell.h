//
//  BrochureCollectionViewCell.h
//  Bonial
//
//  Created by Johann Werner on 2016/03/09.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrochureCollectionViewCell : UICollectionViewCell

@property(weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property(weak, nonatomic) IBOutlet UIImageView *imageView;

@end
