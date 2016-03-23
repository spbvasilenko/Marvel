//
//  AppDelegate.m
//  Marvel
//
//  Created by Igor Vasilenko on 23/03/16.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import "VASAppDelegate.h"
#import "VASRouter.h"

@interface VASAppDelegate ()

@property (strong, nonatomic, readwrite) id <VASRouter> router;

@end

@implementation VASAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self cacheSetup];
    
    return YES;
}

#pragma mark - Cache

- (void)cacheSetup
{
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
                                                         diskCapacity:20 * 1024 * 1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
}

@end
