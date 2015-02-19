//
//  Catalog.h
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Collection.h"

@interface Catalog : NSObject

@property (atomic) NSString* _designer;
@property (atomic) NSMutableArray* _collections;

+(Catalog*)fromJSON:(NSMutableDictionary*)json;
-(NSString*)toString;
-(Collection*)collectionAt:(NSInteger)index;

@end
