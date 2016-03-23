//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVMViewModel.h"

@class RACCommand;
@protocol VASMarvelAPIService;
@class VASCharacter;
@protocol VASRouter;

@interface VASMarvelCharactersListViewModel : RVMViewModel

@property (strong, nonatomic, readonly) id <VASMarvelAPIService> marvelAPIService;
@property (strong, nonatomic, readonly) id <VASRouter> router;

@property (strong, nonatomic, readonly) NSArray <VASCharacter *> *characters;
@property (strong, nonatomic, readonly) RACCommand *reloadCharactersCommand;

- (void)openCharacterInfoViewControllerWithCharacter:(VASCharacter *)character;

@end