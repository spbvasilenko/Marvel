//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASImage.h"

@implementation VASImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    NSStringFromSelector(@selector(path)) : @"path",
                    NSStringFromSelector(@selector(extension)) : @"extension"
            };
}

@end