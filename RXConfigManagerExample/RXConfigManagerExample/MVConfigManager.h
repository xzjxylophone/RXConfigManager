//
//  MVConfigManager.h
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/12/4.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigManager.h"

@interface MVConfigManager : RXConfigManager

@property (nonatomic, assign) BOOL isTest;



#pragma mark - Singleton Model
+ (MVConfigManager *)sharedInstance;
@end
