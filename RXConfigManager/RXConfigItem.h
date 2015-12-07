//
//  RXConfigItem.h
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/12/4.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>


// 用于cell的Item

typedef enum E_RX_ConfigType {
    kE_RX_ConfigType_Select     =           1, // BOOL选择值
    kE_RX_ConfigType_Enum       =           2, // 枚举值
}E_RX_ConfigType;

@interface RXConfigItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *des;
@property (nonatomic, strong) id value;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) E_RX_ConfigType e_RX_ConfigType;

@property (nonatomic, copy) NSString *propertyName;








@end
