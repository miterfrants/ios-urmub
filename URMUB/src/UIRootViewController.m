//
//  UIRootViewController.m
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/16.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import "UIRootViewController.h"
#import "UIConfigViewController.h"
#import "VariableStore.h"
@interface UIRootViewController ()

@end

@implementation UIRootViewController
@synthesize viewPopup;
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
    viewPopup = [[PopupView alloc]init];
    [VariableStore sharedInstance].uvcRoot=self;
    [self.view addSubview:viewPopup];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) awakeFromNib
{
    self.shouldDelegateAutorotateToVisiblePanel=NO;
    self.panningLimitedToTopViewController=NO;

    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"nv"]];
     UIConfigViewController *uvcRight=[self.storyboard instantiateViewControllerWithIdentifier:@"uvcConfig"];
    [self setRightPanel:uvcRight];
    //[vcRight view];
}

//-1:error 0:war 1:note
-(void)popUp:(NSString *) title msg:(NSString *) msg type:(NSInteger) type delay:(double) delay{
    switch (type) {
        case -1:
            [viewPopup setBackgroundColor:[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.6]];
            break;
        case 0:
            [viewPopup setBackgroundColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.1 alpha:0.6]];
            break;
        case 1:
            [viewPopup setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.6]];
            break;
            
        default:
            break;
    }
    //peter modify @selector 不知道要如何把parameter 傳進去
    //如果能放在下面的 fadeIn 以後比較好管理
    viewPopup.lblTitle.text=title;
    viewPopup.lblMessage.text=msg;
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(fadeIn:)
                                   userInfo:nil
                                    repeats:NO];
}
-(void)fadeIn:(id) sender{
    [viewPopup fadeIn:sender];
    [viewPopup.lblMessage setFrame:CGRectMake(5, 10, 300, 40)];
    viewPopup.lblMessage .textColor = [UIColor blackColor];
    viewPopup.lblMessage .font = [UIFont italicSystemFontOfSize:12];
    viewPopup.lblMessage .numberOfLines = 5;
    viewPopup.lblMessage .lineBreakMode = NSLineBreakByWordWrapping;
    [viewPopup.lblTitle setFrame:CGRectMake(5, 5, 300,15)];
    viewPopup.lblTitle .textColor = [UIColor blackColor];
    viewPopup.lblTitle .font = [UIFont italicSystemFontOfSize:15];
    viewPopup.lblTitle .numberOfLines = 1;
    viewPopup.lblTitle .lineBreakMode = NSLineBreakByWordWrapping;
    
}

@end
