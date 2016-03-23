//
//  AppDelegate.h
//  Marvel
//
//  Created by Igor Vasilenko on 23/03/16.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VASRouter;
@protocol VASMarvelAPIServiceProtocol;

@interface VASAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) id <VASMarvelAPIServiceProtocol> marvelAPIService;
@property (strong, nonatomic, readonly) VASRouter *router;
@property (strong, nonatomic) UIWindow *window;


@end

