//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//


#import <Mantle/Mantle.h>

@class VASCharacterDataContainer;

@interface VASCharacterDataWrapper : MTLModel <MTLJSONSerializing>

// The HTTP status code of the returned result.,
@property (assign, nonatomic, readonly) NSInteger code;
// A string description of the call status.,
@property (copy, nonatomic, readonly) NSString *status;
// The copyright notice for the returned result.,
@property (copy, nonatomic, readonly) NSString *copyright;
// The attribution notice for this result. Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.,
@property (copy, nonatomic, readonly) NSString *attributionText;
// An HTML representation of the attribution notice for this result. Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.,
@property (copy, nonatomic, readonly) NSString *attributionHTML;
// The results returned by the call.,
@property (strong, nonatomic, readonly) VASCharacterDataContainer *data;
// A digest value of the content returned by the call.
@property (copy, nonatomic, readonly) NSString *etag;

@end