//
//  PieceViewController.h
//  dtc-ios
//
//  Created by James Barnett on 2/19/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Collection.h"
#import "PageContentViewController.h"

@interface PieceViewController : UIPageViewController

@property (nonatomic, weak) Collection* collection;
// @property (nonatomic, strong) UIPageViewController* pageController;

@end
