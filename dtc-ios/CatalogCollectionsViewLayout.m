//
//  CatalogCollectionsViewLayout.m
//  dtc-ios
//
//  Created by James Barnett on 2/15/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "CatalogCollectionsViewLayout.h"

static NSString* const CatalogCollectionsCellKind = @"CollectionCell";

@interface CatalogCollectionsViewLayout ()

@property (nonatomic, strong) NSDictionary* layoutInfo;

@end

@implementation CatalogCollectionsViewLayout

- (id)init {
  self = [super init];

  return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder {
  self = [super init];

  return self;
}

- (void)setDimensions {
  const float BORDER = 10.0f;
  self.itemInsets = UIEdgeInsetsMake(BORDER, BORDER, BORDER, BORDER);
  self.itemSize = CGSizeMake(self.collectionView.bounds.size.width
                             - self.itemInsets.left
                             - self.itemInsets.right, 40.0f);
  self.numberOfColumns = 1;
}

- (void)prepareLayout {
  [self setDimensions];

  NSMutableDictionary* newLayoutInfo = [NSMutableDictionary dictionary];
  NSMutableDictionary* cellLayoutInfo = [NSMutableDictionary dictionary];

  NSInteger sectionCount = [self.collectionView numberOfSections];
  NSIndexPath* indexPath = [NSIndexPath indexPathForItem:0 inSection:0];

  for (NSInteger section = 0; section < sectionCount; section++) {
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];

    for (NSInteger item = 0; item < itemCount; item++) {
      indexPath = [NSIndexPath indexPathForItem:item inSection:section];

      UICollectionViewLayoutAttributes* itemAttributes =
        [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

      itemAttributes.frame = [self frameForCollectionAtIndexPath:indexPath];
      cellLayoutInfo[indexPath] = itemAttributes;
    }
  }

  newLayoutInfo[CatalogCollectionsCellKind] = cellLayoutInfo;
  self.layoutInfo = newLayoutInfo;
}

- (CGRect)frameForCollectionAtIndexPath:(NSIndexPath*)indexPath {
  int padding = (indexPath.item == 0) ? 2 * self.itemInsets.top : 0;

  CGFloat originX = self.itemInsets.left;
  CGFloat originY = self.itemInsets.top +
    ((indexPath.item - 1)
      * (padding
         + self.itemSize.height
         + self.itemInsets.bottom));

  return CGRectMake(originX, originY, self.itemSize.width, self.itemSize.height);
}

- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
  NSMutableArray* allAtttributes = [NSMutableArray arrayWithCapacity:self.layoutInfo.count];

  [self.layoutInfo enumerateKeysAndObjectsUsingBlock:^(NSString* elementIdentifier,
                                                       NSDictionary* elementsInfo,
                                                       BOOL* stop) {
    [elementsInfo enumerateKeysAndObjectsUsingBlock:^(NSIndexPath* indexPath,
                                                      UICollectionViewLayoutAttributes* attributes,
                                                      BOOL* innerStop) {
      if (CGRectIntersectsRect(rect, attributes.frame)) {
        [allAtttributes addObject:attributes];
      }
    }];
  }];

  return allAtttributes;
}

- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
  return self.layoutInfo[CatalogCollectionsCellKind][indexPath];
}

- (CGSize)collectionViewContentSize {
  NSInteger rowCount = [self.collectionView numberOfSections] / self.numberOfColumns;

  // make sure we count another row if one is only partially filled
  if ([self.collectionView numberOfSections] % self.numberOfColumns) rowCount++;

  CGFloat height = self.itemInsets.top +
                   rowCount * self.itemSize.height + (rowCount - 1) * self.interItemSpacingY +
                   self.itemInsets.bottom;

  return CGSizeMake(self.collectionView.bounds.size.width, height);
}

@end
