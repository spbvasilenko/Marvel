//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "MTLModel.h"
#import "VASCharacter.h"
#import "VASUrl.h"
#import "VASImage.h"
#import "VASComicList.h"
#import "VASStoryList.h"
#import "VASEventList.h"
#import "VASSeriesList.h"


@implementation VASCharacter

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return
            @{
                    NSStringFromSelector(@selector(uid)) : @"id",
                    NSStringFromSelector(@selector(name)) : @"name",
                    NSStringFromSelector(@selector(characterDescription)) : @"description",
                    NSStringFromSelector(@selector(resourceURI)) : @"resourceURI",
                    NSStringFromSelector(@selector(urls)) : @"urls",
                    NSStringFromSelector(@selector(thumbnail)) : @"thumbnail",
                    NSStringFromSelector(@selector(comics)) : @"comics",
                    NSStringFromSelector(@selector(stories)) : @"stories",
                    NSStringFromSelector(@selector(events)) : @"events",
                    NSStringFromSelector(@selector(series)) : @"series"
            };
}

+ (NSValueTransformer *)urlsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[VASUrl class]];
}

+ (NSValueTransformer *)thumbnailJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VASImage class]];
}

+ (NSValueTransformer *)comicsJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VASComicList class]];
}

+ (NSValueTransformer *)storiesJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VASStoryList class]];
}

+ (NSValueTransformer *)eventsJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VASEventList class]];
}

+ (NSValueTransformer *)seriesJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VASSeriesList class]];
}

@end