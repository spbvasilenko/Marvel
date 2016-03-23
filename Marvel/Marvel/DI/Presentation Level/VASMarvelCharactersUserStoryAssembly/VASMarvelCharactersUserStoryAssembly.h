//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
#import "VASMarvelCharactersUserStory.h"

@class VASStoryboardAssembly;
@class VASServiceComponentsAssembly;
@class VASParentAssembly;


@interface VASMarvelCharactersUserStoryAssembly : TyphoonAssembly <VASMarvelCharactersUserStory>

@property (strong, nonatomic, readonly) VASServiceComponentsAssembly *serviceComponentsAssembly;
@property (strong, nonatomic, readonly) VASStoryboardAssembly *storyboardAssembly;
@property (strong, nonatomic, readonly) VASParentAssembly *parentAssembly;

@end