//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "TyphoonAssembly.h"

@protocol VASSessionManager;

@interface VASCoreAssembly : TyphoonAssembly

- (id <VASSessionManager>)sessionManager;

@end