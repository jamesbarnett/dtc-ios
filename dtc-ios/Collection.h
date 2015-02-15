//
//  Collection.h
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject

@property NSString* _season;
@property NSString* _description;
@property NSString* _image;
@property NSMutableArray* _pieces;

+ (Collection*)fromJSON:(NSDictionary*)json;
- (NSString*)toString;

@end
