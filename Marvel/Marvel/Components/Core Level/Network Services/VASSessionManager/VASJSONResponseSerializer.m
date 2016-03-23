//
//  VASJSONResponseSerializer.m
//  Hotels
//
//  Created by Igor Vasilenko on 16/07/15.
//  Copyright (c) 2015 Igor Vasilenko. All rights reserved.
//

#import "VASJSONResponseSerializer.h"

@implementation VASJSONResponseSerializer

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    
    return self;
}

@end
