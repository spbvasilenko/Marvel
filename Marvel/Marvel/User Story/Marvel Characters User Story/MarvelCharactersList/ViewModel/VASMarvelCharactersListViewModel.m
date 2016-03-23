//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VASMarvelCharactersListViewModel.h"
#import "RACCommand.h"
#import "VASMarvelAPIService.h"
#import <Typhoon/Typhoon.h>

@interface VASMarvelCharactersListViewModel ()

@property (strong, nonatomic, readwrite) id <VASMarvelAPIService> marvelAPIService;
@property (strong, nonatomic, readwrite) NSArray *charactersCellModels;

@end

@implementation VASMarvelCharactersListViewModel

- (void)typhoonDidInject
{
    [self.reloadCharactersCommand execute:nil];
}

- (RACCommand *)reloadCharactersCommand
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self.marvelAPIService.rac_getMarvelCharacters map:^id(NSArray *characters) {
            self.charactersCellModels = [characters copy];
            return nil;
        }];
    }];
}

@end