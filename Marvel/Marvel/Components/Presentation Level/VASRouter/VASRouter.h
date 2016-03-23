//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VASRouterProtocol.h"


@interface VASRouter : NSObject <VASRouterProtocol>

#pragma mark - Init
- (nonnull instancetype)initWithNavigationController:(nonnull UINavigationController *)navigationController;

@end