//
//  RXConfigManager.h
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/11/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum E_RX_ServerType {
    kE_RX_ServerType_Product        =           1,  // 正式环境
    kE_RX_ServerType_Pre            =           2,  // 预发布环境
    kE_RX_ServerType_Test           =           3,  // 测试环境
    kE_RX_ServerType_Other          =           4,  // 其他环境
}E_RX_ServerType;




@interface RXConfigManager : NSObject


#pragma mark - Property
// 服务器网络环境, DEBUG默认是Test,RELEASE默认是Product
@property (nonatomic, assign) E_RX_ServerType e_RX_ServerType;
// 是否记录网络输出, 默认的是YES
@property (nonatomic, assign) BOOL isRecordHttpLog;

#pragma mark - Public
// 所有的属性
- (NSArray *)allProperty;
// 基本的配置信息
- (NSArray *)baseConfigItems;
// 保存到磁盘
- (void)saveToDisk;



#pragma mark - Need To Override

// 所有属性的默认值,子类需要重写
- (NSDictionary *)defaultProvertyValue;

#pragma mark - Singleton Model
+ (RXConfigManager *)sharedInstance;

@end
