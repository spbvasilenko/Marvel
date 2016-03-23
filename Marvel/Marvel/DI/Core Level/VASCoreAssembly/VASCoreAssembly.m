//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASCoreAssembly.h"
#import "VASSessionManagerProtocol.h"
#import "VASSessionManager.h"


@implementation VASCoreAssembly

- (id <VASSessionManagerProtocol>)sessionManager
{
    return [TyphoonDefinition withClass:[VASSessionManager class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithSessionConfiguration:)
                        parameters:^(TyphoonMethod *initializer) {
                            [initializer injectParameterWith:[NSURLSessionConfiguration defaultSessionConfiguration]];
                        }];
    }];
}

@end