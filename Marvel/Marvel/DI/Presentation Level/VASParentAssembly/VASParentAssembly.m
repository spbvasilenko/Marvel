//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASParentAssembly.h"
#import "VASRouterImpl.h"
#import "VASStoryboardAssembly.h"
#import "VASMarvelCharactersUserStoryAssembly.h"

@interface VASParentAssembly ()

@property (strong, nonatomic, readwrite) VASMarvelCharactersUserStoryAssembly *marvelCharactersUserStoryAssembly;

@end

@implementation VASParentAssembly

- (id <VASRouter>)router
{
    return [TyphoonDefinition withClass:[VASRouterImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(marvelCharactersUserStory) with:self.marvelCharactersUserStoryAssembly];
        [definition useInitializer:@selector(initWithNavigationController:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[[UINavigationController alloc] init]];
        }];
    }];
}

@end