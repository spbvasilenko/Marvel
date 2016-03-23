//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASServiceComponentsAssembly.h"
#import "VASMarvelAPIServiceProtocol.h"
#import "VASCoreAssembly.h"
#import "VASMarvelAPIService.h"

@interface VASServiceComponentsAssembly ()

@property (strong, nonatomic, readwrite) VASCoreAssembly *coreAssembly;

@end

@implementation VASServiceComponentsAssembly

- (id <VASMarvelAPIServiceProtocol>)marvelAPIService
{
    return [TyphoonDefinition withClass:[VASMarvelAPIService class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(sessionManager) with:[self.coreAssembly sessionManager]];
    }];
}

@end