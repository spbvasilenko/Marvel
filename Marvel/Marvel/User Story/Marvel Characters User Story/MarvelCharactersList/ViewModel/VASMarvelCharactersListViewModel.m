//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VASMarvelCharactersListViewModel.h"
#import "RACCommand.h"
#import "VASMarvelAPIService.h"
#import "VASCharacter.h"
#import "VASCharacterDataWrapper.h"
#import "VASCharacterDataContainer.h"
#import "VASRouter.h"
#import <Typhoon/Typhoon.h>

@interface VASMarvelCharactersListViewModel ()

@property (strong, nonatomic, readwrite) id <VASMarvelAPIService> marvelAPIService;
@property (strong, nonatomic, readwrite) id <VASRouter> router;
@property (strong, nonatomic, readwrite) NSArray *characters;

@end

@implementation VASMarvelCharactersListViewModel

- (void)typhoonDidInject
{
    [self.reloadCharactersCommand execute:nil];
}

- (RACCommand *)reloadCharactersCommand
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self.marvelAPIService.rac_getMarvelCharacters doNext:^(VASCharacterDataWrapper *characterDataWrapper) {
            self.characters = [characterDataWrapper.data.results copy];
        }];
    }];
}

- (void)openCharacterInfoViewControllerWithCharacter:(VASCharacter *)character
{
    [self.router openMarvelCharacterInfoControllerWithCharacter:character];
}


@end