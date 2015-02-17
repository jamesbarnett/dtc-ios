//
//  CatalogCollectionsViewController.h
//  dtc-ios
//
//  Created by James Barnett on 2/15/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CatalogCollectionsViewLayout.h"
#import "Catalog.h"

@interface CatalogCollectionsViewController : UICollectionViewController

@property (nonatomic, weak) IBOutlet CatalogCollectionsViewLayout* collectionLayout;
@property (nonatomic) Catalog* _catalog;

@end
