//
//  MVConfigManager.m
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/12/4.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MVConfigManager.h"

@implementation MVConfigManager









#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
        
        self.isTest = YES;
        
        
    }
    return self;
}
- (void)dealloc
{
    
}








#pragma mark - Singleton Model
+ (MVConfigManager *)sharedInstance
{
    static MVConfigManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
