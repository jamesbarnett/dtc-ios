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

- (UIViewController*)pageViewController:(UIPageViewController*)pageViewController
     viewControllerBeforeViewController:(UIViewController*)viewController {
  NSUInteger index = [(PageContentViewController*)viewController pageIndex];

  if (index == 0) {
    return nil;
  }

  index--;

  return [self viewControllerAtIndex:index];
}

- (UIViewController*)pageViewController:(UIPageViewController*)pageViewController
      viewControllerAfterViewController:(UIViewController*)viewController {
  NSUInteger index = [(PageContentViewController*)viewController pageIndex];

  index++;

  if (index > [self.currentCollection._pieces count]) {
    return nil;
  }

  return [self viewControllerAtIndex:index];
}

- (PageContentViewController*)viewControllerAtIndex:(NSUInteger)index {
  PageContentViewController* pageContentViewController
    = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];

  if (([self.currentCollection._pieces count] == 0)
      || (index >= [self.currentCollection._pieces count])) {
    return nil;
  }

  pageContentViewController.piece = (Piece*)self.currentCollection._pieces[index];
  pageContentViewController.pageIndex = index;

  return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController*)pageViewController {
  return [self.currentCollection._pieces count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController*)pageViewController {
  return 0;
}

- (Collection*) collectionAt:(NSInteger)index {
  return [self._catalog collectionAt:index];
}

- (Collection*) currentCollection {
  return [self._catalog collectionAt:self.collectionIndex];
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

  return collectionCell;
}

- (void)collectionView:(UICollectionView*)collectionView
  didSelectItemAtIndexPath:(NSIndexPath*)indexPath {
  self.collectionIndex = indexPath.row;
  [self performSegueWithIdentifier:@"PieceViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"PieceViewSegue"])
  {
    PieceViewController* pvc = [segue destinationViewController];

    pvc.collection = [self._catalog collectionAt:collectionIndex];
    pvc.dataSource = self;
    self.pieceViewController = pvc;

    PageContentViewController* pageContentViewController = [self viewControllerAtIndex:0];
    pageContentViewController.piece = self.currentCollection._pieces[0];
    NSArray* viewControllers = @[pageContentViewController];
    self.pieceViewController.view.frame
      = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);

    [self addChildViewController: self.pieceViewController];
    [self.view addSubview:pvc.view];
    [self.pieceViewController setViewControllers:viewControllers
      direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    self.pieceViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width,
      self.view.frame.size.height - 30);
  }
}

@end
