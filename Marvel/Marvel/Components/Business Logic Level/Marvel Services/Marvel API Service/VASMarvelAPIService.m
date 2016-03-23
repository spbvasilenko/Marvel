//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASMarvelAPIService.h"
#import "RACSignal.h"
#import "VASSessionManager.h"
#import "VASCharacterDataWrapper.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface VASMarvelAPIService ()

@property (strong, nonatomic, readwrite) VASSessionManager *sessionManager;
@property (strong, nonatomic, readwrite) RACSignal *rac_reachabilitySignal;

@end

@implementation VASMarvelAPIService

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

#pragma mark - Helpers

- (RACSignal *)rac_reachabilitySignal
{
    if (!_rac_reachabilitySignal) {
        _rac_reachabilitySignal = [self reachabilitySignalWithManager:self.sessionManager.reachabilityManager];
    }
    return _rac_reachabilitySignal;
}

- (RACSignal *)reachabilitySignalWithManager:(AFNetworkReachabilityManager *)reachabilityManager
{
    RACSignal *reachableSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            [subscriber sendNext:@(status)];
        }];
        return [RACDisposable disposableWithBlock:^{
            [reachabilityManager stopMonitoring];
        }];
    }].replayLast;

    [reachabilityManager startMonitoring];

    return reachableSignal;
}

@end