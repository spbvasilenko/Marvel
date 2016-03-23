//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASSeriesList.h"
#import "VASSeriesSummary.h"


@implementation VASSeriesList

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    NSStringFromSelector(@selector(available)) : @"available",
                    NSStringFromSelector(@selector(returned)) : @"returned",
                    //NSStringFromSelector(@selector(collectionURI)) : @"collectionURI",
                    NSStringFromSelector(@selector(items)) : @"items"
            };
}

+ (NSValueTransformer *)itemsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[VASSeriesSummary class]];
}

@end