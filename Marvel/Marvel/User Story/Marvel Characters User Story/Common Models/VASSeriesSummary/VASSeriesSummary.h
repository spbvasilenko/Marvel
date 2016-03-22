//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VASSeriesSummary : MTLModel <MTLJSONSerializing>

// The path to the individual series resource.,
@property (copy, nonatomic, readonly) NSString *resourceURI;
// The canonical name of the series.
@property (copy, nonatomic, readonly) NSString *name;

@end