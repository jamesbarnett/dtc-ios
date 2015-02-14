//
//  Catalog.m
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "Catalog.h"
#import "Collection.h"

@implementation Catalog

-(id)init {
  if (self = [super init]) {
    self._collections = [NSMutableArray new];
  }

  return self;
}

+(Catalog*) fromJSON: (NSMutableDictionary*)json {
  Catalog* catalog = [Catalog new];

  catalog._designer = [json objectForKey:@"designer"];

  for (NSDictionary* item in [json objectForKey:@"collections"]) {
    [catalog._collections addObject:[Collection fromJSON:item]];
  }

  return catalog;
}

-(NSString*)toString {
  [NSString stringWithFormat:@"Catalog { designer: %@ }", self._designer];

  NSMutableString* buffer = [NSMutableString new];

  [buffer appendFormat:@"Catalog { designed: %@ ", self._designer];

  [buffer appendString:@" Collections ["];

  for (Collection* collection in self._collections) {
    [buffer appendFormat:@" %@", [collection toString]];
  }

  [buffer appendString:@" ]"];

  return buffer;
}
@end
