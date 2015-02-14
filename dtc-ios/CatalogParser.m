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

-(void) parse {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"catalog" ofType:@"json"];
  NSLog(@"filePath is %@", filePath);
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  NSString *jsonContent = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
  NSLog(@"data is %@", jsonContent);
  NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
  NSLog(@"designer: %@", [json objectForKey:@"designer"]);
  NSLog(@"json count is %lu", [json count]);
}

@end
