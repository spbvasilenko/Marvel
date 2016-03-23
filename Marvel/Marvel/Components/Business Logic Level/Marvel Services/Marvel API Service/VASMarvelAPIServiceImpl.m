//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASMarvelAPIServiceImpl.h"
#import "RACSignal.h"
#import "VASCharacterDataWrapper.h"
#import "VASSessionManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>

@interface VASMarvelAPIServiceImpl ()

@property (strong, nonatomic, readwrite) id <VASSessionManager> sessionManager;

@end

@implementation VASMarvelAPIServiceImpl

- (RACSignal *)rac_getMarvelCharacters
{
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {

        NSURLSessionDataTask *dataTask = [self.sessionManager method:VASHTTPMethodGET
                                                           URLString:@"http://gateway.marvel.com:80/v1/public/characters"
                                                          parameters:@{@"apikey" : @"6232fb1fbddf303ee3773920bb6754d8"}
                                                         resultClass:[VASCharacterDataWrapper class]
                                                              forKey:nil
                                                             success:^(NSURLSessionDataTask *task, id responseObject) {
                                                                 [subscriber sendNext:responseObject];
                                                                 [subscriber sendCompleted];
                                                             }
                                                             failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                                 [subscriber sendError:error];
                                                                 [subscriber sendCompleted];
                                                             }];
        [dataTask resume];

        return [RACDisposable disposableWithBlock:^{
            [dataTask cancel];
        }];
    }];
}

@end