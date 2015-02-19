//
//  CollectionViewCell.m
//  dtc-ios
//
//  Created by James Barnett on 2/15/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

@synthesize label;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
    self.label = [[UILabel alloc] initWithFrame:self.bounds];

    self.label.contentMode = UIViewContentModeScaleAspectFill;
    self.label.clipsToBounds = YES;
    [self.contentView addSubview:self.label];
  }

  return self;
}

@end
