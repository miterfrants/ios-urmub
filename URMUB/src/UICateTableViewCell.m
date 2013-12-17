//
//  UICateTableViewCell.m
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/14.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import "UICateTableViewCell.h"

@implementation UICateTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
