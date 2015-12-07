//
//  RXConfigManagerDefine.m
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/12/7.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigManagerDefine.h"

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




