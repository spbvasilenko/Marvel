//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VASRouter.h"

@class TyphoonStoryboard;


@interface VASRouterImpl : NSObject <VASRouter>

@property (strong, nonatomic, readonly) TyphoonStoryboard *storyboard;

#pragma mark - Init
- (nonnull instancetype)initWithNavigationController:(nonnull UINavigationController *)navigationController;

@end