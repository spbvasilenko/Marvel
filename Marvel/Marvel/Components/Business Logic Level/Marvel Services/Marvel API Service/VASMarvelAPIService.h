//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VASMarvelAPIServiceProtocol.h"

@class RACSignal;
@class VASSessionManager;


@interface VASMarvelAPIService : NSObject <VASMarvelAPIServiceProtocol>

@property (strong, nonatomic, readonly) VASSessionManager *sessionManager;
@property (strong, nonatomic, readonly) RACSignal *rac_reachabilitySignal;

@end