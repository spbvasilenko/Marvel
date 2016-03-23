//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VASCharacter;

@protocol VASRouter <NSObject>

@property (strong, nonatomic) UINavigationController *navigationController;

#pragma mark - Navigation
- (void)openMarvelCharactersListViewController;
- (void)openMarvelCharacterInfoControllerWithCharacter:(VASCharacter *)character;

@end