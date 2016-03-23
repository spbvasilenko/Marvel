//
//  VASURLSessionManager.h
//
//  Created by Igor Vasilenko on 14/06/15.
//  Copyright (c) 2015 Igor Vasilenko. All rights reserved.
//

#import "AFURLSessionManager.h"
#import "VASSessionManager.h"

@class VASSessionResponseSerializer;
@class RACSignal;

@interface VASSessionManagerImpl : AFURLSessionManager <VASSessionManager>

@property (strong, nonatomic, readonly) VASSessionResponseSerializer *sessionResponseSerializer;

@end
