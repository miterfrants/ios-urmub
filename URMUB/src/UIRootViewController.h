//
//  UIRootViewController.h
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/16.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "PopupView.h"
@interface UIRootViewController : JASidePanelController
@property (nonatomic,retain) PopupView* viewPopup;
-(void)popUp:(NSString *) title msg:(NSString *) msg type:(NSInteger) type delay:(double) delay;
@end
