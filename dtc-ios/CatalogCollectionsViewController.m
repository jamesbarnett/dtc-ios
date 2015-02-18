//
//  CatalogCollectionsViewController.m
//  dtc-ios
//
//  Created by James Barnett on 2/15/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "CatalogCollectionsViewController.h"
#import "CatalogParser.h"
#import "CatalogCollectionsViewLayout.h"
#import "CollectionViewCell.h"

static NSString* const CollectionCellIdentifier = @"CollectionCell";

@interface CatalogCollectionsViewController ()

@end

@implementation CatalogCollectionsViewController


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


- (NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section {
  return [[self._catalog _collections] count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                                          cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  CollectionViewCell* collectionCell =
    [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier
      forIndexPath:indexPath];

  return collectionCell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {

}
*/

@end
