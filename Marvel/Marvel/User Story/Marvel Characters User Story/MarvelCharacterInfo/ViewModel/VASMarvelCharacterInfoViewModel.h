//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "RVMViewModel.h"

@class VASCharacter;
@protocol VASMarvelAPIService;
@class RACCommand;

@interface VASMarvelCharacterInfoViewModel : RVMViewModel

@property (strong, nonatomic, readonly) VASCharacter *character;
@property (strong, nonatomic, readonly) id <VASMarvelAPIService> marvelAPIService;
@property (strong, nonatomic, readonly) RACCommand *reloadCharacterCommand;

- (instancetype)initWithCharacter:(VASCharacter *)character;

@end