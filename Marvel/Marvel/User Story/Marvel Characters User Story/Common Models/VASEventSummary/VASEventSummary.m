//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASEventSummary.h"


@implementation VASEventSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    //NSStringFromSelector(@selector(resourceURI)) : @"resourceURI",
                    NSStringFromSelector(@selector(name)) : @"name"
            };
}

@end