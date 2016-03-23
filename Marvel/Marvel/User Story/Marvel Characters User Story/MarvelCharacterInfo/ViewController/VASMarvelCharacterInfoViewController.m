//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASMarvelCharacterInfoViewController.h"
#import "VASMarvelCharacterInfoViewModel.h"
#import "VASCharacterTableViewCell.h"
#import "UITableView+VASCellNibRegistration.h"
#import <ReactiveCocoa.h>

@interface VASMarvelCharacterInfoViewController ()

@property (strong, nonatomic, readwrite) VASMarvelCharacterInfoViewModel *viewModel;


@end

@implementation VASMarvelCharacterInfoViewController

#pragma mark - VC lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Character Info";
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.rac_command = self.viewModel.reloadCharacterCommand;

    [self bindUI];
}

#pragma mark - Bind UI

- (void)bindUI
{
    [[RACObserve(self.viewModel, tableViewCharacterContent) deliverOnMainThread] subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel.sectionTitles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.viewModel.sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = self.viewModel.sectionTitles[section];
    NSArray *sectionContent = [self.viewModel.tableViewCharacterContent objectForKey:sectionTitle];
    return [sectionContent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VASCharacterTableViewCell *cell = [self.tableView dequeueCellOfClass:[VASCharacterTableViewCell class]];

    NSString *sectionTitle = self.viewModel.sectionTitles[indexPath.section];
    NSArray *sectionContent = [self.viewModel.tableViewCharacterContent objectForKey:sectionTitle];
    cell.textLabel.text = sectionContent[indexPath.row];

    return cell;
}

@end