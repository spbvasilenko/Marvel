//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASCoreAssembly.h"
#import "VASSessionManager.h"
#import "VASSessionManagerImpl.h"


@implementation VASCoreAssembly

- (id <VASSessionManager>)sessionManager
{
    return [TyphoonDefinition withClass:[VASSessionManagerImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithSessionConfiguration:)
                        parameters:^(TyphoonMethod *initializer) {
                            [initializer injectParameterWith:[NSURLSessionConfiguration defaultSessionConfiguration]];
                        }];
    }];
}

@end