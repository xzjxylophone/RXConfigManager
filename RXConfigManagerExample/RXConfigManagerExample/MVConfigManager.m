//
//  MVConfigManager.m
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/12/4.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MVConfigManager.h"
#import "RXConfigItem.h"
@implementation MVConfigManager




#pragma mark - Override

- (NSDictionary *)defaultProvertyValue
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[super defaultProvertyValue]];
    NSDictionary *dic2 = @{@"isTest":@(YES)};
    [dic setValuesForKeysWithDictionary:dic2];
    return dic;
}



#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
        
        
        
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
