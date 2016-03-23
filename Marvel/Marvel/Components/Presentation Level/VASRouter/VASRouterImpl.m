//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <AFNetworking/AFURLResponseSerialization.h>
#import "VASRouterImpl.h"
#import "TyphoonStoryboard.h"

@interface VASRouterImpl ()

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic, readwrite) TyphoonStoryboard *storyboard;

@end

@implementation VASRouterImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
    }
    return self;
}

@end