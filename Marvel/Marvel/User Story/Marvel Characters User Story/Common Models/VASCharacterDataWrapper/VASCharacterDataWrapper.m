//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASCharacterDataWrapper.h"
#import "VASCharacterDataContainer.h"


@implementation VASCharacterDataWrapper

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    NSStringFromSelector(@selector(code)) : @"code",
                    NSStringFromSelector(@selector(status)) : @"status",
                    NSStringFromSelector(@selector(copyright)) : @"copyright",
                    NSStringFromSelector(@selector(attributionText)) : @"attributionText",
                    NSStringFromSelector(@selector(attributionHTML)) : @"attributionHTML",
                    NSStringFromSelector(@selector(data)) : @"data",
                    NSStringFromSelector(@selector(etag)) : @"etag"
            };
}

+ (NSValueTransformer *)dataJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VASCharacterDataContainer class]];
}

@end