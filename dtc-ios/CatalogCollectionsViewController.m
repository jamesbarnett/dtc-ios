//
//  CatalogCollectionsViewController.m
//  dtc-ios
//
//  Created by James Barnett on 2/15/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "CatalogCollectionsViewController.h"
#import "PieceViewController.h"
#import "CatalogParser.h"
#import "CatalogCollectionsViewLayout.h"
#import "CollectionViewCell.h"
#import "Catalog.h"
#import "Collection.h"

static NSString* const CollectionCellIdentifier = @"CollectionCell";

@interface CatalogCollectionsViewController ()

@end

@implementation CatalogCollectionsViewController

@synthesize collectionIndex;

- (void)viewDidLoad {
  [super viewDidLoad];

  self.collectionView.backgroundColor = [UIColor colorWithWhite:0.25f alpha:1.0f];

  // Register cell classes
  [self.collectionView registerClass:[CollectionViewCell class]
    forCellWithReuseIdentifier:CollectionCellIdentifier];

  CatalogParser* parser = [CatalogParser new];
  self._catalog = [parser parse];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView
  numberOfItemsInSection:(NSInteger)section {
  return [[self._catalog _collections] count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                                          cellForItemAtIndexPath:(NSIndexPath*)indexPath {
  CollectionViewCell* collectionCell =
    [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier
      forIndexPath:indexPath];

  collectionCell.label.text = [self._catalog collectionAt:indexPath.row]._season;
  NSLog(@"creating cells!");
  return collectionCell;
}

- (void)collectionView:(UICollectionView*)collectionView
  didSelectItemAtIndexPath:(NSIndexPath*)indexPath {
  NSLog(@"Selected item at %ld", indexPath.row);
  self.collectionIndex = indexPath.row;
  [self performSegueWithIdentifier:@"PieceViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"PieceViewSegue"])
  {
    PieceViewController* pieceViewController = [segue destinationViewController];
    pieceViewController.collection = [self._catalog collectionAt:collectionIndex];
  }
}

@end
