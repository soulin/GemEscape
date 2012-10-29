//
//  TileCoord.m
//  GemEscape
//
//  Implements TileCoord.h
//
//  Created by Peter Lin on 22/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TileCoord.h"

//  various keys used in encoding/decoding
#define ROW_ENCODER_KEY @"ROW_ENCODER_KEY"
#define COL_ENCODER_KEY @"COL_ENCODER_KEY"

@implementation TileCoord
@synthesize row = _row;
@synthesize column = _column;

//  see TileCoord.h
+ (TileCoord *) coordWithRow: (int) row AndColumn: (int) col
{
    TileCoord *tc = [[TileCoord alloc] init];
    tc.row = row;
    tc.column = col;
    return tc;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    //  simply returns a copy
    TileCoord *copy = [[[self class] allocWithZone: zone] init];
    copy.row = self.row;
    copy.column = self.column;
    return copy;
}

- (BOOL)isEqual:(id)anObject
{
    //  two TileCoord objects are equal if they have the same row and column
    if ([anObject isKindOfClass:[self class]]) {
        TileCoord *obj = anObject;
        return (obj.row == self.row && obj.column == self.column);
    }
    return NO;
}

- (NSUInteger)hash
{
    //  the hash is generated by this algo should be fairly good in this application, 
    //  if the number of columns exceeds 256, this needs to be updated to improve performance
    return self.row * 256 + self.column;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInt:self.row forKey:ROW_ENCODER_KEY];
    [encoder encodeInt:self.column forKey:COL_ENCODER_KEY];
    
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.row = [decoder decodeIntForKey:ROW_ENCODER_KEY];
        self.column = [decoder decodeIntForKey:COL_ENCODER_KEY];
    }
    return self;
}

@end
