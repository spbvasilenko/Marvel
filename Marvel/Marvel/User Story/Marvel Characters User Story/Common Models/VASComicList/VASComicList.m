//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASComicList.h"
#import "VASComicSummary.h"

@implementation VASComicList

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    NSStringFromSelector(@selector(available)) : @"available",
                    NSStringFromSelector(@selector(returned)) : @"returned",
                    NSStringFromSelector(@selector(items)) : @"items"
            };
}

+ (NSValueTransformer *)itemsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[VASComicSummary class]];
}


@end