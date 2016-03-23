//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <AFNetworking/AFURLResponseSerialization.h>
#import "VASRouterImpl.h"
#import "TyphoonStoryboard.h"
#import "VASMarvelCharactersUserStory.h"

@interface VASRouterImpl ()

@property (strong, nonatomic, readwrite) id <VASMarvelCharactersUserStory> marvelCharactersUserStory;

@end

@implementation VASRouterImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
    }
    return self;
}

- (void)openMarvelCharactersListViewController
{
    VASMarvelCharactersListViewController *marvelCharactersListViewController = [self.marvelCharactersUserStory marvelCharactersListViewController];
    [self.navigationController setViewControllers:@[marvelCharactersListViewController] animated:NO];
}

- (void)openMarvelCharacterInfoControllerWithCharacter:(VASCharacter *)character
{
    VASMarvelCharacterInfoViewController *marvelCharacterInfoViewController = [self.marvelCharactersUserStory marvelCharacterInfoViewControllerWithCharacter:character];
    [self.navigationController pushViewController:marvelCharacterInfoViewController animated:YES];
}

@end