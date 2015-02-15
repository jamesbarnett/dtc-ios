//
//  CatalogParser.m
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "CatalogParser.h"
#import "Catalog.h"

@implementation CatalogParser

- (Catalog*)parse {
  NSString* filePath = [[NSBundle mainBundle] pathForResource:@"catalog" ofType:@"json"];
  NSData* data = [NSData dataWithContentsOfFile:filePath];
  NSMutableDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

  return [Catalog fromJSON:json];
}

@end
