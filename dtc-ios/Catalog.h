//
//  Catalog.h
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject

@property NSString* _designer;
@property NSMutableArray* _collections;

+(Catalog*)fromJSON: (NSMutableDictionary*) json;
-(NSString*)toString;

@end
