//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VASImage : MTLModel <MTLJSONSerializing>

// The directory path of to the image.,
@property (copy, nonatomic, readonly) NSString *path;
// The file extension for the image.
@property (copy, nonatomic, readonly) NSString *extension;

@end