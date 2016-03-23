//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASMarvelCharactersListViewController.h"
#import "VASMarvelCharactersListViewModel.h"
#import "VASMarvelCharacterInfoViewController.h"
#import "VASCharacter.h"
#import "VASCharacterTableViewCell.h"
#import "UITableView+VASCellNibRegistration.h"
#import <ReactiveCocoa.h>

@interface VASMarvelCharactersListViewController () <UITableViewDataSource>

@end

@implementation VASMarvelCharactersListViewController

#pragma mark - VC lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Marvel";
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.rac_command = self.viewModel.reloadCharactersCommand;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self bindUI];
}

#pragma mark - Bind UI

- (void)bindUI
{
    [[RACObserve(self.viewModel, characters) deliverOnMainThread] subscribeNext:^(id x) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.characters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VASCharacterTableViewCell *characterTableViewCell = [self.tableView dequeueCellOfClass:[VASCharacterTableViewCell class]];
    [characterTableViewCell setupWithCharacter:self.viewModel.characters[indexPath.row]];
    return characterTableViewCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel openCharacterInfoViewControllerWithCharacter:self.viewModel.characters[indexPath.row]];
}

@end