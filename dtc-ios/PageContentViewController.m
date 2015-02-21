//
//  PageContentViewController.m
//  dtc-ios
//
//  Created by James Barnett on 2/20/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "PageContentViewController.h"
#import "PieceView.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  NSLog(@"Piece: %@", self.piece.description);
  ((PieceView*)self.view).titleLabel.text = self.piece._title;
  ((PieceView*)self.view).descriptionLabel.text = self.piece._description;
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
