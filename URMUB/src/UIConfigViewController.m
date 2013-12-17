//
//  UIConfigViewController.m
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/16.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import "UIConfigViewController.h"
#import "Util.h"
#import "VariableStore.h"
#import "JASidePanelController.h"
@interface UIConfigViewController ()

@end

@implementation UIConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _txtDomain = [[UITextField alloc]init];
    [_txtDomain setFrame:CGRectMake(80, 30, 180, 48)];
    [_txtDomain setBackgroundColor:[Util colorWithHexString:@"#DDDDDDFF"]];
    _txtDomain.text=[VariableStore sharedInstance].domain;
    _txtDomain.textAlignment=NSTextAlignmentCenter;
    [[self view]addSubview:_txtDomain];
    
    _btnSave = [[UIButton alloc] init];
    [_btnSave setFrame:CGRectMake(80, 100, 80, 50)];
    _btnSave.titleLabel.text= @"save";
    [_btnSave setTitle:@"save" forState:UIControlStateNormal];
    _btnSave.titleLabel.textColor = [Util colorWithHexString:@"#000000FF"];
    [_btnSave addTarget:self action:@selector(saveDomain) forControlEvents:UIControlEventTouchUpInside];
    [_btnSave setBackgroundColor:[Util colorWithHexString:@"#DDDDDDFF"]];
    [[self view] addSubview:_btnSave];
	// Do any additional setup after loading the view.
}
-(void)saveDomain{
    [VariableStore sharedInstance].domain=_txtDomain.text;
    [self.sidePanelController showCenterPanelAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
