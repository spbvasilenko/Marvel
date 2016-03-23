//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASCharacterDataWrapper.h"
#import "VASCharacterDataContainer.h"


@implementation VASCharacterDataWrapper

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}

+ (NSValueTransformer *)dataJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VASCharacterDataContainer class]];
}

@end