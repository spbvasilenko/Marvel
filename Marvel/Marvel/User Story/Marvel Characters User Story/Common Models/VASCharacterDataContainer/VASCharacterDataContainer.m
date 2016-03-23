//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASCharacterDataContainer.h"
#import "VASCharacter.h"


@implementation VASCharacterDataContainer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}

+ (NSValueTransformer *)resultsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[VASCharacter class]];
}

@end