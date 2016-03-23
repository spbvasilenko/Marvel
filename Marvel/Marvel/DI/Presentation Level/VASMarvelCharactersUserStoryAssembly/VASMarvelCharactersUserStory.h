//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VASMarvelCharactersListViewController;
@class VASMarvelCharacterInfoViewController;
@class VASCharacter;

@protocol VASMarvelCharactersUserStory <NSObject>

- (VASMarvelCharactersListViewController *)marvelCharactersListViewController;
- (VASMarvelCharacterInfoViewController *)marvelCharacterInfoViewControllerWithCharacter:(VASCharacter *)character;

@end