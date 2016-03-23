//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VASMarvelCharactersListViewModel;

@interface VASMarvelCharactersListViewController : UITableViewController

@property (strong, nonatomic) VASMarvelCharactersListViewModel *viewModel;

@end