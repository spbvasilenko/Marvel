//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Mantle/Mantle.h>

@class VASCharacter;

@interface VASCharacterDataContainer : MTLModel <MTLJSONSerializing>

// The requested offset (number of skipped results) of the call.,
@property (assign, nonatomic, readonly) NSInteger offset;
// The requested result limit.,
@property (assign, nonatomic, readonly) NSInteger limit;
// The total number of resources available given the current filter set.,
@property (assign, nonatomic, readonly) NSInteger total;
// The total number of results returned by this call.,
@property (assign, nonatomic, readonly) NSInteger count;
// The list of characters returned by the call.
@property (strong, nonatomic, readonly) NSArray <VASCharacter *> *results;

@end