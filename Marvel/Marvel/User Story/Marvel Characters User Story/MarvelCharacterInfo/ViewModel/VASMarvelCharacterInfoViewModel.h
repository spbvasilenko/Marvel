//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "RVMViewModel.h"

@class VASCharacter;
@protocol VASMarvelAPIService;
@class RACCommand;
@protocol VASRouter;

@interface VASMarvelCharacterInfoViewModel : RVMViewModel

@property (strong, nonatomic, readonly) id <VASMarvelAPIService> marvelAPIService;
@property (strong, nonatomic, readonly) id <VASRouter> router;

@property (strong, nonatomic, readonly) VASCharacter *character;

@property (strong, nonatomic, readonly) NSDictionary *tableViewCharacterContent;
@property (strong, nonatomic, readonly) NSArray *sectionTitles;

@property (strong, nonatomic, readonly) RACCommand *reloadCharacterCommand;

- (instancetype)initWithCharacter:(VASCharacter *)character;

@end