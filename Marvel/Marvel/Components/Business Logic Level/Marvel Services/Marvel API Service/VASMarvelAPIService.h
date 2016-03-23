//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;
@class VASSessionManager;


@interface VASMarvelAPIService : NSObject

@property (strong, nonatomic, readonly) VASSessionManager *sessionManager;
@property (strong, nonatomic, readonly) RACSignal *rac_reachabilitySignal;

- (RACSignal *)rac_getMarvelCharactersList;

@end