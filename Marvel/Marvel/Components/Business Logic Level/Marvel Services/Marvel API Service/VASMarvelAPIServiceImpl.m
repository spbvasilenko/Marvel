//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASMarvelAPIServiceImpl.h"
#import "RACSignal.h"
#import "VASCharacterDataWrapper.h"
#import "VASSessionManager.h"
#import "VASCharacter.h"
#import "NSString+MD5.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <CommonCrypto/CommonDigest.h>

@interface VASMarvelAPIServiceImpl ()

@property (strong, nonatomic, readwrite) id <VASSessionManager> sessionManager;

@property (nonatomic, copy) NSString *timestamp;
@property (nonatomic, copy) NSString *publicKey;
@property (nonatomic, copy) NSString *privateKey;
@property (nonatomic, copy) NSString *(^calculateMD5)(NSString *);

@end

@implementation VASMarvelAPIServiceImpl

- (RACSignal *)rac_getMarvelCharacters
{
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {

        NSURLSessionDataTask *dataTask = [self.sessionManager method:VASHTTPMethodGET
                                                           URLString:@"http://gateway.marvel.com/v1/public/characters"
                                                          parameters:[self baseAPIParameters]
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

- (RACSignal *)rac_getMarvelCharacterWithId:(NSInteger)characterId
{
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {

        NSURLSessionDataTask *dataTask = [self.sessionManager method:VASHTTPMethodGET
                                                           URLString:[NSString stringWithFormat:@"http://gateway.marvel.com/v1/public/characters/%d", characterId]
                                                          parameters:[self baseAPIParameters]
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

- (NSMutableDictionary *)baseAPIParameters
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"apikey"] = self.publicKey;
    dictionary[@"ts"] = self.timestamp;
    dictionary[@"hash"] = self.calculateMD5(self.timestampedKeys);
    return dictionary;
}

- (NSString *)timestamp
{
    if (!_timestamp) {
        _timestamp = @([NSDate date].timeIntervalSinceReferenceDate).stringValue;
    }
    return _timestamp;
}

- (NSString *)publicKey
{
    return @"6232fb1fbddf303ee3773920bb6754d8";
}

- (NSString *)privateKey
{
    return @"d2dbb39e48f1e0e379946a2f473952e4f6f6fb7e";
}

- (NSString *(^)(NSString *))calculateMD5
{
    return ^(NSString *str){
        const char *cstr = [str UTF8String];
        unsigned char digest[CC_MD5_DIGEST_LENGTH];
        CC_MD5(cstr, (CC_LONG)strlen(cstr), digest);
        return [NSString stringWithFormat:
                @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                digest[0], digest[1], digest[2], digest[3],
                digest[4], digest[5], digest[6], digest[7],
                digest[8], digest[9], digest[10], digest[11],
                digest[12], digest[13], digest[14], digest[15]];
    };
}

- (NSString *)timestampedKeys
{
    return [NSString stringWithFormat:@"%@%@%@", self.timestamp, self.privateKey, self.publicKey];
}

@end