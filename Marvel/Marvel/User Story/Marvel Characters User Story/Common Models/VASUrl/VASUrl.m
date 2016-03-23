//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASUrl.h"


@implementation VASUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    NSStringFromSelector(@selector(type)) : @"type",
                    NSStringFromSelector(@selector(url)) : @"url"
            };
}

@end