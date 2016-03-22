//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VASUrl : MTLModel <MTLJSONSerializing>

// A text identifier for the URL.,
@property (copy, nonatomic, readonly) NSString *type;
// A full URL (including scheme, domain, and path).
@property (copy, nonatomic, readonly) NSString *url;

@end