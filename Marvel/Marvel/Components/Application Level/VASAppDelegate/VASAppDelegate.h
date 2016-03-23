//
//  AppDelegate.h
//  Marvel
//
//  Created by Igor Vasilenko on 23/03/16.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VASMarvelAPIService;
@protocol VASRouter;

@interface VASAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic, readonly) id <VASRouter> router;
@property (strong, nonatomic) UIWindow *window;


@end

