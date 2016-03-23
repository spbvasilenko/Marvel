//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Mantle/Mantle.h>

@class VASUrl;
@class VASImage;
@class VASComicList;
@class VASStoryList;
@class VASEventList;
@class VASSeriesList;

@interface VASCharacter : MTLModel <MTLJSONSerializing>

//// The unique ID of the character resource.,
@property (assign, nonatomic, readonly) NSInteger uid;
//// The name of the character.,
@property (copy, nonatomic, readonly) NSString *name;
//// A short bio or description of the character.,
@property (copy, nonatomic, readonly) NSString *characterDescription;
//// The date the resource was most recently modified.,
@property (strong, nonatomic, readonly) NSDate *modified;
//// The canonical URL identifier for this resource.,
@property (copy, nonatomic, readonly) NSString *resourceURI;
//// A set of public web site URLs for the resource.,
@property (strong, nonatomic, readonly) NSArray <VASUrl *> *urls;
////// The representative image for this character.,
@property (strong, nonatomic, readonly) VASImage *thumbnail;
////// A resource list containing comics which feature this character.,
@property (strong, nonatomic, readonly) VASComicList *comics;
////// A resource list of stories in which this character appears.,
@property (strong, nonatomic, readonly) VASStoryList *stories;
////// A resource list of events in which this character appears.,
@property (strong, nonatomic, readonly) VASEventList *events;
////// A resource list of series in which this character appears.
@property (strong, nonatomic, readonly) VASSeriesList *series;

@end
