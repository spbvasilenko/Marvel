//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VASMarvelCharacterInfoViewModel;


@interface VASMarvelCharacterInfoViewController : UITableViewController

@property (strong, nonatomic, readonly) VASMarvelCharacterInfoViewModel *viewModel;

@end