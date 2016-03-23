//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASServiceComponentsAssembly.h"
#import "VASMarvelAPIService.h"
#import "VASCoreAssembly.h"
#import "VASMarvelAPIServiceImpl.h"

@interface VASServiceComponentsAssembly ()

@property (strong, nonatomic, readwrite) VASCoreAssembly *coreAssembly;

@end

@implementation VASServiceComponentsAssembly

- (id <VASMarvelAPIService>)marvelAPIService
{
    return [TyphoonDefinition withClass:[VASMarvelAPIServiceImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(sessionManager) with:[self.coreAssembly sessionManager]];
    }];
}

@end