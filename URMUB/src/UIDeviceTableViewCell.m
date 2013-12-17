//
//  UIDeviceTableViewCell.m
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/14.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import "UIDeviceTableViewCell.h"

@implementation UIDeviceTableViewCell

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //resignFirstResponder for the UITextView
    //call didSelectRow of tableView again, by passing the touch to the super class
    [super touchesBegan:touches withEvent:event];

}

@end
