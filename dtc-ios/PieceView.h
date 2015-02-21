//
//  PieceView.h
//  dtc-ios
//
//  Created by James Barnett on 2/20/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieceView : UIView

@property (weak, nonatomic) IBOutlet UIImageView* pieceImage;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;


@end
