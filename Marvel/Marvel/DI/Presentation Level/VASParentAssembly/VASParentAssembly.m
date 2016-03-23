//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASParentAssembly.h"
#import "VASRouter.h"


@implementation VASParentAssembly

- (VASRouter *)router
{
    return [TyphoonDefinition withClass:[VASRouter class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNavigationController:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[[UINavigationController alloc] init]];
        }];
    }];
}

@end