//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Mantle/Mantle.h>

@class VASComicSummary;

@interface VASComicList : MTLModel <MTLJSONSerializing>

// The number of total available issues in this list. Will always be greater than or equal to the "returned" value.,
@property (assign, nonatomic, readonly) NSInteger available;
// The number of issues returned in this collection (up to 20).,
@property (assign, nonatomic, readonly) NSInteger returned;
// The path to the full list of issues in this collection.,
@property (copy, nonatomic, readonly) NSString *collectionURI;
// The list of returned issues in this collection.
@property (strong, nonatomic, readonly) NSArray <VASComicSummary *> *items;

@end