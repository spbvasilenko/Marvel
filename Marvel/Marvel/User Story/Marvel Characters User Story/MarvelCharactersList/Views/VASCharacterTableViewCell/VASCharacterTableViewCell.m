//
// Created by Igor Vasilenko on 23/03/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "VASCharacterTableViewCell.h"
#import "VASCharacter.h"


@implementation VASCharacterTableViewCell

- (void)setupWithCharacter:(VASCharacter *)character
{
    _character = character;

    self.textLabel.text = character.name;
}


@end