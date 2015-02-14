//
//  Collection.m
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "Collection.h"
#import "Piece.h"

@implementation Collection

-(id)init {
  if (self = [super init]) {
    self._pieces = [NSMutableArray new];
  }

  return self;
}

+(Collection*) fromJSON: (NSDictionary*)json {
  Collection* collection = [Collection new];

  collection._season = [json objectForKey:@"season"];
  collection._description = [json objectForKey:@"description"];
  collection._image = [json objectForKey:@"image"];

  for (NSDictionary* item in [json objectForKey:@"pieces"]) {
    [collection._pieces addObject:[Piece fromJSON:item]];
  }
  return collection;
}

-(NSString*)toString {

  [NSString stringWithFormat:@"Collection { season: %@ }", self._season];

  NSMutableString* buffer = [NSMutableString new];

  [buffer appendFormat:@"Collection { season: %@ ", self._season];
  [buffer appendFormat:@"desction: %@ ", self._description];
  [buffer appendFormat:@"image: %@ ", self._image];

  [buffer appendString:@"Pieces [ "];

  for (Piece* piece in self._pieces) {
    [buffer appendFormat:@"%@", [piece toString]];
  }

  [buffer appendString:@" ]"];

  return buffer;
}

@end
