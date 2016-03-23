//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Typhoon/TyphoonFactoryDefinition.h>
#import "VASMarvelCharactersUserStoryAssembly.h"
#import "MTLModel.h"
#import "VASCharacter.h"
#import "VASMarvelCharactersListViewModel.h"
#import "VASMarvelCharacterInfoViewModel.h"
#import "VASStoryboardAssembly.h"
#import "VASServiceComponentsAssembly.h"
#import "VASParentAssembly.h"

static NSString *const kVASMarvelCharactersListViewControllerID = @"marvelCharactersListViewController";
static NSString *const kVASMarvelCharacterInfoViewControllerID = @"marvelCharacterInfoViewController";

@interface VASMarvelCharactersUserStoryAssembly ()

@property (strong, nonatomic, readwrite) VASStoryboardAssembly *storyboardAssembly;
@property (strong, nonatomic, readwrite) VASServiceComponentsAssembly *serviceComponentsAssembly;
@property (strong, nonatomic, readwrite) VASParentAssembly *parentAssembly;

@end

@implementation VASMarvelCharactersUserStoryAssembly

#pragma mark - Protocol Implementation

- (VASMarvelCharactersListViewController *)marvelCharactersListViewController
{
    return [TyphoonDefinition withFactory:[self.storyboardAssembly mainStoryboard]
                                 selector:@selector(instantiateViewControllerWithIdentifier:)
                               parameters:^(TyphoonMethod *factoryMethod) {
                                   [factoryMethod injectParameterWith:kVASMarvelCharactersListViewControllerID];
                               } configuration:^(TyphoonFactoryDefinition *definition) {
                [definition injectProperty:@selector(viewModel) with:[self marvelCharactersListViewModel]];
            }];
}

- (VASMarvelCharacterInfoViewController *)marvelCharacterInfoViewControllerWithCharacter:(VASCharacter *)character
{
    return [TyphoonDefinition withFactory:[self.storyboardAssembly mainStoryboard]
                                 selector:@selector(instantiateViewControllerWithIdentifier:)
                               parameters:^(TyphoonMethod *factoryMethod) {
                                   [factoryMethod injectParameterWith:kVASMarvelCharacterInfoViewControllerID];
                               } configuration:^(TyphoonFactoryDefinition *definition) {
                [definition injectProperty:@selector(viewModel) with:[self marvelCharacterInfoViewModelWithCharacter:character]];
            }];
}

#pragma mark - ViewModels

- (VASMarvelCharactersListViewModel *)marvelCharactersListViewModel
{
    return [TyphoonDefinition withClass:[VASMarvelCharactersListViewModel class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(marvelAPIService) with:[self.serviceComponentsAssembly marvelAPIService]];
        [definition injectProperty:@selector(router) with:[self.parentAssembly router]];
    }];
}

- (VASMarvelCharacterInfoViewModel *)marvelCharacterInfoViewModelWithCharacter:(VASCharacter *)character
{
    return [TyphoonDefinition withClass:[VASMarvelCharacterInfoViewModel class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(marvelAPIService) with:[self.serviceComponentsAssembly marvelAPIService]];
        [definition injectProperty:@selector(router) with:[self.parentAssembly router]];
        [definition useInitializer:@selector(initWithCharacter:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:character];
        }];
    }];
}

@end