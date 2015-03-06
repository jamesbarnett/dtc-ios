//
//  Piece.m
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import "Piece.h"

@implementation Piece

+ (Piece*)fromJSON:(NSDictionary*)json {
  Piece* piece = [Piece new];

  piece._title = [json objectForKey:@"title"];
  piece._description = [json objectForKey:@"description"];
  NSLog(@"Piece#fromJSON.image: %@", [json objectForKey:@"image"]);
  piece._image = [json objectForKey:@"image"];

  return piece;
}

- (NSString*)toString {
  return [NSString stringWithFormat:@" Piece { title: %@, description: %@, image: %@ }",
          self._title, self._description, self._image];
}

@end
