//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <ReactiveCocoa/RACStream.h>
#import <ReactiveCocoa/RACSignal.h>
#import <ReactiveCocoa/RACSignal+Operations.h>
#import "VASMarvelCharacterInfoViewModel.h"
#import "MTLModel.h"
#import "VASCharacter.h"
#import "VASMarvelAPIService.h"
#import "RACCommand.h"
#import "Typhoon.h"

@interface VASMarvelCharacterInfoViewModel ()

@property (strong, nonatomic, readwrite) VASCharacter *character;
@property (strong, nonatomic, readwrite) id <VASMarvelAPIService> marvelAPIService;


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

}

- (RACCommand *)reloadCharacterCommand
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [[self.marvelAPIService rac_getMarvelCharacterWithId:self.character.uid] doNext:^(VASCharacter *character) {
            self.character = character;
        }];
    }];
}

@end