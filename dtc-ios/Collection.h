//
//  Collection.h
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject

@property (atomic) NSString* _season;
@property (atomic) NSString* _description;
@property (atomic) NSString* _image;
@property (atomic) NSMutableArray* _pieces;

+ (Collection*)fromJSON:(NSDictionary*)json;
- (NSString*)toString;

@end
