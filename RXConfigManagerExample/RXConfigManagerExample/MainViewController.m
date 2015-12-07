//
//  MainViewController.m
//  RXConfigManagerExample
//
//  Created by Rush.D.Xzj on 15/11/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXConfigManagerHeader.h"
#import "RXTableViewItemHeader.h"
#import "MVConfigManager.h"
@interface MainViewController ()

@end

@implementation MainViewController


- (NSArray *)allConfigItems
{
    
    MVConfigManager *cm = [MVConfigManager sharedInstance];
    
    
    NSMutableArray *ary = [NSMutableArray array];
    RXConfigItem *item = [[RXConfigItem alloc] init];
    item.title = @"服务器环境";
    item.propertyName = @"e_RX_ServerType";
    item.e_RX_ConfigType = kE_RX_ConfigType_Enum;
    item.value = @(cm.e_RX_ServerType);
    item.des = NSStringFromE_RX_ServerType(cm.e_RX_ServerType);
    [ary addObject:item];
    
    
    item = [[RXConfigItem alloc] init];
    item.title = @"是否是test";
    item.propertyName = @"isTest";
    item.e_RX_ConfigType = kE_RX_ConfigType_Select;
    item.value = @(cm.isTest);
    [ary addObject:item];
    
    return ary;
}




#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    NSMutableArray *ary = [NSMutableArray arrayWithArray:self.appControlSectionItem.items];
    [ary addObjectsFromArray:[self allConfigItems]];
    
    self.appControlSectionItem.items = ary;
    NSDictionary *dic = [MVConfigManager sharedInstance].dictionaryValue;
    NSLog(@"dic:%@", dic);
    for (NSString *key in dic.allKeys) {
        NSLog(@"key:%@", key);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
