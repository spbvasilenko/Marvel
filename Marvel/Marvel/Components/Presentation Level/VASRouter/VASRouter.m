//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <AFNetworking/AFURLResponseSerialization.h>
#import "VASRouter.h"

@interface VASRouter ()

@property (strong, nonatomic) UINavigationController *navigationController;

@end

@implementation VASRouter

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
    }
    return self;
}

@end