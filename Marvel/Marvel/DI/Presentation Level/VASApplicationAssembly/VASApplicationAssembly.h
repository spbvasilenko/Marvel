//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class VASAppDelegate;
@class VASParentAssembly;
@class VASServiceComponentsAssembly;


@interface VASApplicationAssembly : TyphoonAssembly

@property (strong, nonatomic, readonly) VASParentAssembly *parentAssembly;

- (VASAppDelegate *)appDelegate;

@end