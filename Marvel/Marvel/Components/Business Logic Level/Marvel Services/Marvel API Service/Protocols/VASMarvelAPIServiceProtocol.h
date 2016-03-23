//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@protocol VASMarvelAPIServiceProtocol <NSObject>

#pragma mark - Marvel Characters
- (RACSignal *)rac_getMarvelCharacters;

@end