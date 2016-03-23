//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VASRouter.h"

@class TyphoonStoryboard;
@protocol VASMarvelCharactersUserStory;


@interface VASRouterImpl : NSObject <VASRouter>

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic, readonly, nonnull) id <VASMarvelCharactersUserStory> marvelCharactersUserStory;

#pragma mark - Init
- (nonnull instancetype)initWithNavigationController:(nonnull UINavigationController *)navigationController;

@end