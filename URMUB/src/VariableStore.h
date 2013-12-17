//
//  VariableStore.h
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/16.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface VariableStore : NSObject
@property NSString *domain;
@property UIViewController *uvcRoot;
@property CLLocation *myLocation;
// message from which our instance is obtained
+ (VariableStore *)sharedInstance;
@end
