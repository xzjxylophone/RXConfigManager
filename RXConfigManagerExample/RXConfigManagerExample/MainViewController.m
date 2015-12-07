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
#import "RXCategoryHeader.h"
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
    item.action = @selector(serverAction);
    [ary addObject:item];
    
    item = [[RXConfigItem alloc] init];
    item.title = @"是否记录网络请求日志";
    item.propertyName = @"isRecordHttpLog";
    item.e_RX_ConfigType = kE_RX_ConfigType_Select;
    item.value = @(cm.isRecordHttpLog);
    [ary addObject:item];
    
    
    
    item = [[RXConfigItem alloc] init];
    item.title = @"是否是test";
    item.propertyName = @"isTest";
    item.e_RX_ConfigType = kE_RX_ConfigType_Select;
    item.value = @(cm.isTest);
    [ary addObject:item];
    
    return ary;
}

#pragma mark - Action
- (void)serverAction
{
    
    NSLog(@"action:::::");
    
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"1", @"2", @"3", nil];
    [as showInView:self.view];
}

- (void)bbiSaveAction:(id)sender
{
    NSLog(@"save");
    
    [[MVConfigManager sharedInstance] saveToDisk];
}
- (void)mySwitchValueChanged:(id)sender
{
    UISwitch *mySwitch = sender;
    UITableViewCell *cell = [mySwitch rx_clsViewFromCls:[UITableViewCell class]];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    RXTVSectionItem *sectionItem = self.functionItems[indexPath.section];
    id item = sectionItem.items[indexPath.row];
    if ([item isKindOfClass:[RXConfigItem class]]) {
        RXConfigItem *tmp = item;
        if (tmp.e_RX_ConfigType == kE_RX_ConfigType_Select) {
            [[MVConfigManager sharedInstance] setValue:@(mySwitch.isOn) forKey:tmp.propertyName];
        }
    }
}



#pragma mark - UITableViewDataSource
#pragma mark Required
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RXConfigCell *cell = (RXConfigCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell.mySwitch addTarget:self action:@selector(mySwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
    return cell;
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
