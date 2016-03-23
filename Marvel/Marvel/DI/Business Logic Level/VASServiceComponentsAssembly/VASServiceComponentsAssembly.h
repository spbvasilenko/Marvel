//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "TyphoonAssembly.h"

@protocol VASMarvelAPIService;
@class VASCoreAssembly;

@interface VASServiceComponentsAssembly : TyphoonAssembly

@property (strong, nonatomic, readonly) VASCoreAssembly *coreAssembly;

- (id <VASMarvelAPIService>)marvelAPIService;

@end