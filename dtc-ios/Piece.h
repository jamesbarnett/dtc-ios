//
//  Piece.h
//  dtc-ios
//
//  Created by James Barnett on 2/13/15.
//  Copyright (c) 2015 vivid-abstraction. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Piece : NSObject

@property (nonatomic) NSString* _title;
@property (nonatomic) NSString* _description;
@property (nonatomic) NSString* _image;

+(Piece*)fromJSON:(NSDictionary*)json;
-(NSString*)toString;

@end
