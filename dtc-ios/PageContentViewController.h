//
//  PageContentViewController.h
//  dtc-ios
//
//  Created by James Barnett on 2/20/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Piece.h"

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property NSUInteger pageIndex;
@property NSString* titleText;
@property (weak, nonatomic) Piece* piece;

@end
