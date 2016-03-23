//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class VASRouterImpl;
@class VASStoryboardAssembly;
@protocol VASRouter;
@class VASMarvelCharactersUserStoryAssembly;

@interface VASParentAssembly : TyphoonAssembly

@property (strong, nonatomic, readonly) VASMarvelCharactersUserStoryAssembly *marvelCharactersUserStoryAssembly;

- (id <VASRouter>)router;

@end