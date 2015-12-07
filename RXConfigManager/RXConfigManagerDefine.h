//
//  RXConfigManagerDefine.h
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/12/7.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum E_RX_ServerType {
    kE_RX_ServerType_Product        =           1,  // 正式环境
    kE_RX_ServerType_Pre            =           2,  // 预发布环境
    kE_RX_ServerType_Test           =           3,  // 测试环境
    kE_RX_ServerType_Other          =           4,  // 未定义
}E_RX_ServerType;

NSString *NSStringFromE_RX_ServerType(E_RX_ServerType type);



// 用于cell的Item

typedef enum E_RX_ConfigType {
    kE_RX_ConfigType_Select     =           1, // BOOL选择值
    kE_RX_ConfigType_Enum       =           2, // 枚举值
}E_RX_ConfigType;


#define NKey_RX_ConfigChanged       @"NKey_RX_ConfigChanged"




