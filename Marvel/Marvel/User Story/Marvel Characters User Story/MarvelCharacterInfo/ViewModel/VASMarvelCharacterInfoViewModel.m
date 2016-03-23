//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VASMarvelCharacterInfoViewModel.h"
#import "MTLModel.h"
#import "VASCharacter.h"
#import "VASMarvelAPIService.h"
#import "Typhoon.h"
#import "VASRouter.h"
#import "VASCharacterDataWrapper.h"
#import "VASCharacterDataContainer.h"
#import "VASComicList.h"
#import "VASComicSummary.h"
#import "VASStorySummary.h"
#import "VASStoryList.h"
#import "VASSeriesList.h"
#import "VASSeriesSummary.h"

@interface VASMarvelCharacterInfoViewModel ()

@property (strong, nonatomic, readwrite) id <VASMarvelAPIService> marvelAPIService;
@property (strong, nonatomic, readwrite) id <VASRouter> router;

@property (strong, nonatomic, readwrite) VASCharacter *character;
@property (strong, nonatomic, readwrite) NSDictionary *tableViewCharacterContent;
@property (strong, nonatomic, readwrite) NSArray *sectionTitles;

@end

@implementation VASMarvelCharacterInfoViewModel

- (instancetype)initWithCharacter:(VASCharacter *)character
{
    self = [super init];
    if (self) {
        self.character = character;
    }
    return self;
}

- (void)typhoonDidInject
{
    [self prepareCharacterInfo];
}

- (void)prepareCharacterInfo
{
    [[RACObserve(self, character) deliverOn:[RACScheduler scheduler]] subscribeNext:^(VASCharacter *character) {
        NSMutableDictionary *temp = [NSMutableDictionary dictionary];
        NSMutableArray *comics = [NSMutableArray array];
        NSMutableArray *stories = [NSMutableArray array];
        NSMutableArray *series = [NSMutableArray array];
        [character.comics.items enumerateObjectsUsingBlock:^(VASComicSummary *comicSummary, NSUInteger idx, BOOL *stop) {
            [comics addObject:comicSummary.name];
        }];
        [character.stories.items enumerateObjectsUsingBlock:^(VASStorySummary *storySummary, NSUInteger idx, BOOL *stop) {
            [stories addObject:storySummary.name];
        }];
        [character.series.items enumerateObjectsUsingBlock:^(VASSeriesSummary *seriesSummary, NSUInteger idx, BOOL *stop) {
            [series addObject:seriesSummary.name];
        }];
        [temp setValue:comics forKey:@"Character Comics"];
        [temp setValue:stories forKey:@"Character Stories"];
        [temp setValue:series forKey:@"Character Series"];
        self.tableViewCharacterContent = temp;
        self.sectionTitles = [self.tableViewCharacterContent allKeys];
    }];
}

- (RACCommand *)reloadCharacterCommand
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [[[self.marvelAPIService rac_getMarvelCharacterWithId:self.character.uid] subscribeOn:[RACScheduler scheduler]] doNext:^(VASCharacterDataWrapper *characterDataWrapper) {
            self.character = [characterDataWrapper.data.results firstObject];
        }];
    }];
}

@end