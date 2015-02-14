//
//  Piece.h
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Piece : NSObject

@property NSString* _title;
@property NSString* _description;
@property NSString* _image;

+(Piece*)fromJSON: (NSDictionary*)json;
-(NSString*)toString;

@end
