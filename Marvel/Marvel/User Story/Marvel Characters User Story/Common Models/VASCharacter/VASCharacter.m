//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

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
                    NSStringFromSelector(@selector(characterDescription)) : @"description"
            };
}



@end