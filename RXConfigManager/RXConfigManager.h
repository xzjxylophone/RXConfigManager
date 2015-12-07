//
//  RXConfigManager.h
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/11/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXConfigManagerDefine.h"




@interface RXConfigManager : NSObject


#pragma mark - Property
// 服务器网络环境, DEBUG默认是Test,RELEASE默认是Product
@property (nonatomic, assign) E_RX_ServerType e_RX_ServerType;
// 是否记录网络输出, 默认的是YES
@property (nonatomic, assign) BOOL isRecordHttpLog;

#pragma mark - Public
// 所有的属性
- (NSArray *)allProperty;

// 保存到磁盘
- (void)saveToDisk;
// 所有属性得到的一个字典
- (NSDictionary *)dictionaryValue;



#pragma mark - Need To Override

// 所有属性的默认值,子类需要重写
- (NSDictionary *)defaultProvertyValue;


// 如果有子类的话, 那就不推荐使用此单例类
#pragma mark - Singleton Model
+ (RXConfigManager *)sharedInstance;

@end
