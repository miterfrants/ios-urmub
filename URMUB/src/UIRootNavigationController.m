//
//  UIRootNavigationController.m
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/16.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import "UIRootNavigationController.h"
#import "VariableStore.h"
@interface UIRootNavigationController ()

@end

@implementation UIRootNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    [VariableStore sharedInstance].uvcRoot=self;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
