//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASApplicationAssembly.h"
#import "VASAppDelegate.h"
#import "VASParentAssembly.h"
#import "VASServiceComponentsAssembly.h"

@interface VASApplicationAssembly ()

@property (strong, nonatomic, readwrite) VASParentAssembly *parentAssembly;

@end

@implementation VASApplicationAssembly

- (VASAppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[VASAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(router) with:[self.parentAssembly router]];
        [definition injectProperty:@selector(marvelAPIService) with:[self.serviceComponentsAssembly marvelAPIService]];
    }];
}

@end