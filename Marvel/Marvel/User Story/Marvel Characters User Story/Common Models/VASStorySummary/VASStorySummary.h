//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VASStorySummary : MTLModel <MTLJSONSerializing>

// The path to the individual story resource.,
//@property (copy, nonatomic, readonly) NSString *resourceURI;
// The canonical name of the story.,
@property (copy, nonatomic, readonly) NSString *name;
// The type of the story (interior or cover).
@property (copy, nonatomic, readonly) NSString *type;

@end