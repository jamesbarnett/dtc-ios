//
//  PieceViewController.m
//  dtc-ios
//
//  Created by James Barnett on 2/19/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "PieceViewController.h"
#import "PieceView.h"
#import "Piece.h"

@interface PieceViewController ()

@end

@implementation PieceViewController

@synthesize collection;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  ((PieceView*)self.view).titleLabel.text = [self.collection pieceAt:0]._title;
  ((PieceView*)self.view).descriptionLabel.text = [self.collection pieceAt:0]._description;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
