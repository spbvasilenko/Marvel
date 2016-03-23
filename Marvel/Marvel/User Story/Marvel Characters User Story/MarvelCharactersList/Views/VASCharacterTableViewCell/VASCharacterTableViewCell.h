//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VASCharacter;


@interface VASCharacterTableViewCell : UITableViewCell

@property (strong, nonatomic, readonly) VASCharacter *character;

- (void)setupWithCharacter:(VASCharacter *)character;

@end