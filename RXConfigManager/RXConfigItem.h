//
//  RXConfigItem.h
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/12/4.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXConfigManagerDefine.h"


@interface RXConfigItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *des;
@property (nonatomic, strong) id value;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) E_RX_ConfigType e_RX_ConfigType;

// 只有在e_RX_ConfigType是kE_RX_ConfigType_Enum有效
@property (nonatomic, strong) NSArray *enumStrAry; // 枚举字符串数组
@property (nonatomic, assign) NSInteger enumStartIndex; // 枚举起始Index

@property (nonatomic, copy) NSString *propertyName;








@end
