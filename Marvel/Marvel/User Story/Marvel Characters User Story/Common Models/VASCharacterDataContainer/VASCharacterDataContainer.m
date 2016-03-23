//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASCharacterDataContainer.h"
#import "VASCharacter.h"


@implementation VASCharacterDataContainer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    NSStringFromSelector(@selector(offset)) : @"offset",
                    NSStringFromSelector(@selector(limit)) : @"limit",
                    NSStringFromSelector(@selector(total)) : @"total",
                    NSStringFromSelector(@selector(count)) : @"count",
                    NSStringFromSelector(@selector(results)) : @"results"
            };
}

+ (NSValueTransformer *)resultsJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[VASCharacter class]];
}

@end