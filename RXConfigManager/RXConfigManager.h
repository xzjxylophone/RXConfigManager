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


@property (nonatomic, assign) E_RX_ServerType e_RX_ServerType;  // 开发环境
// 是否在release的环境强制可以切换服务器的type, 默认在release环境是Product环境, 默认是No
@property (nonatomic, assign) BOOL isForceToChangeServerTypeWhenRelease;




// 每个App自己管理的配置类去实现单例


@end
