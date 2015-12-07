//
//  RXConfigManager.m
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/11/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigManager.h"

#import <objc/runtime.h>
#import "RXConfigItem.h"


NSString *NSStringFromE_RX_ServerType(E_RX_ServerType type)
{
    switch (type) {
        case kE_RX_ServerType_Test:
            return @"测试环境";
        case kE_RX_ServerType_Pre:
            return @"预发布环境";
        case kE_RX_ServerType_Product:
            return @"生产环境";
        case kE_RX_ServerType_Other:
        default:
            return @"未定义";
    }
}



#define UDKey_RX_ConfigManager      @"UDKey_RX_ConfigManager"
@interface RXConfigManager ()

@end

@implementation RXConfigManager



#pragma mark - Public
- (NSArray *)allProperty
{
    NSMutableArray *ary = [NSMutableArray array];
    Class cls = [self class];
    do {
        NSArray *tmpAry = [self propertyNameAryFromCls:cls];
        [ary addObjectsFromArray:tmpAry];
        cls = [cls superclass];
    } while (![NSStringFromClass(cls) isEqualToString:@"NSObject"]);
    return ary;
}



- (void)saveToDisk
{
    NSDictionary *dic = [self dictionaryValue];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:dic forKey:UDKey_RX_ConfigManager];
    [ud synchronize];
}
- (NSDictionary *)dictionaryValue
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSArray *allProperty = [self allProperty];
    for (NSString *str in allProperty) {
        id value = [self valueForKey:str];
        if (value != nil) {
            [dic setObject:value forKey:str];
        }
    }
    return dic;
}

#pragma mark - Need To Override
- (NSDictionary *)defaultProvertyValue
{
    E_RX_ServerType serverType = kE_RX_ServerType_Product;
#if DEBUG
    // Debug模式默认是测试环境
    serverType = kE_RX_ServerType_Test;
#else
    // Release模式默认是正式环境
    serverType = kE_RX_ServerType_Product;
#endif
    // 如果有新的需要重写
    return @{@"e_RX_ServerType":@(serverType),
             @"isRecordHttpLog":@(YES)};
}

#pragma mark - Private

- (NSArray *)propertyNameAryFromCls:(Class)cls
{
    NSMutableArray *resultAry = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:(NSUTF8StringEncoding)];
        [resultAry addObject:propertyName];
    }
    free(properties);
    return resultAry;
}


- (void)loadFromDisk
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [ud valueForKey:UDKey_RX_ConfigManager];
    [self loadFromDictionary:dic];
}
- (void)loadFromDictionary:(NSDictionary *)dic
{
    NSArray *allProperty = [self allProperty];
    NSDictionary *defaultDic = [self defaultProvertyValue];
    for (NSString *key in allProperty) {
        id defaultValue = defaultDic[key];
        id dicValue = dic[key];
        id setValue = dicValue;
        if (setValue == nil) {
            // 如果没有赋值就使用默认值
            setValue = defaultValue;
        }
        [self setValue:setValue forKey:key];
    }
}

#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
        [self loadFromDisk];
    }
    return self;
}
- (void)dealloc
{
    
}








#pragma mark - Singleton Model
+ (RXConfigManager *)sharedInstance
{
    static RXConfigManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
