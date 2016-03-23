//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASStoryboardAssembly.h"
#import "TyphoonDefinition.h"
#import "TyphoonStoryboard.h"

static NSString *const kVASMainStoryboardName = @"Main";

@implementation VASStoryboardAssembly

- (TyphoonStoryboard *)mainStoryboard
{
    return [TyphoonDefinition withClass:[TyphoonStoryboard class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(storyboardWithName:factory:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:kVASMainStoryboardName];
            [initializer injectParameterWith:self];
            [initializer injectParameterWith:[NSBundle mainBundle]];
        }];
    }];
}

@end