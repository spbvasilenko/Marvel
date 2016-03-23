//
//  VASURLSessionManager.h
//
//  Created by Igor Vasilenko on 14/06/15.
//  Copyright (c) 2015 Igor Vasilenko. All rights reserved.
//

#import "AFURLSessionManager.h"
#import "VASSessionManagerProtocol.h"

@class VASSessionResponseSerializer;

@interface VASSessionManager : AFURLSessionManager <VASSessionManagerProtocol>

@property (nonatomic, strong, readonly) VASSessionResponseSerializer *sessionResponseSerializer;

@end
