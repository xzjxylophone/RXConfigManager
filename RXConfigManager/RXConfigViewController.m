//
//  RXConfigViewController.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/23.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigViewController.h"
#import "RXPushTokenManager.h"
#import "RXTableViewItemHeader.h"
#import "RXInfoHelper.h"
#import "UIDevice+RXUtility.h"
#import "RXConfigCell.h"
#import "RXConfigManager.h"
@interface RXConfigViewController ()

@property (strong, nonatomic) UITableView *tableView;



@end

@implementation RXConfigViewController




#pragma mark - UITableViewDataSource
#pragma mark Required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RXTVSectionItem *sectionItem = self.functionItems[section];
    return sectionItem.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RXTVSectionItem *sectionItem = self.functionItems[indexPath.section];
    RXFunctionItem *item = sectionItem.items[indexPath.row];
    NSString *identify = [RXConfigCell identifier];
    RXConfigCell *cell = (RXConfigCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[RXConfigCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setData:item];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.functionItems.count;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RXConfigCell cellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RXTVSectionItem *sectionItem = self.functionItems[indexPath.section];
    RXFunctionItem *item = sectionItem.items[indexPath.row];
    if (item.action != nil) {
        [self performSelector:item.action withObject:nil afterDelay:0];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    RXTVSectionItem *sectionItem = self.functionItems[section];
    UIView *view = sectionItem.data;
    return view.frame.size.height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    RXTVSectionItem *sectionItem = self.functionItems[section];
    UIView *view = sectionItem.data;
    return view;
}
#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
    
    
    UIColor *bgColor = [UIColor grayColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    
    
    
    self.title = @"各种信息及调试开关";
    
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 50;
    
    // app control
    
    UILabel *appControlLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    appControlLabelView.backgroundColor = bgColor;
    appControlLabelView.text = @"App控制信息";
    
    
    
    self.appControlSectionItem = [[RXTVSectionItem alloc] init];
    self.appControlSectionItem.data = appControlLabelView;
    
    RXFunctionItem *item100 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"服务器版本" action:nil type:0];
    RXFunctionItem *item101 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"在Release下配置有效" action:nil type:0];
    
    self.appControlSectionItem.items = @[item100, item101];
    
    
    
    
    
    
    
    // app info
    
    UILabel *appInfoLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    appInfoLabelView.backgroundColor = bgColor;
    
    appInfoLabelView.text = @"App应用基本信息";
    
    
    
    self.appInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.appInfoSectionItem.data = appInfoLabelView;
    
    
    NSString *object000 = @"";
#if DEBUG
    object000 = @"DEBUG模式";
#else
    object000 = @"RELEASE模式";
#endif
    RXFunctionItem *item000 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"编译方式" action:nil type:0 object:object000];
    
    
    
    RXFunctionItem *item10 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Version" action:nil type:0 object:([RXInfoHelper appVersion])];
    RXFunctionItem *item11 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Build" action:nil type:0 object:([RXInfoHelper appBuild])];
    RXFunctionItem *item12 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Identifier" action:nil type:0 object:([RXInfoHelper appBundleIdentifier])];
    RXFunctionItem *item13 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"应用名称" action:nil type:0 object:([RXInfoHelper appBundleName])];
    
    
    RXFunctionItem *item14 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"应用push" action:nil type:0 object:([RXPushTokenManager lastPushToken])];
    
    
    
    
    self.appInfoSectionItem.items = @[item000, item10, item11, item12, item13, item14];
    
    
    
    
    
    // iphone base info
    UILabel *baseInfoLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    baseInfoLabelView.backgroundColor = bgColor;
    baseInfoLabelView.text = @"手机及iOS系统信息";
    self.baseInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.baseInfoSectionItem.data = baseInfoLabelView;
    
    
    UIDevice *device = [UIDevice currentDevice];
    
    
    
    UIScreen *screen = [UIScreen mainScreen];
    
    CGFloat width1 = screen.bounds.size.width;
    CGFloat height1 = screen.bounds.size.height;
    NSString *sizeString = [NSString stringWithFormat:@"%.0f*%.0f", width1, height1];
    
    
    NSString *nativeSizeString = @"iOS 8系统以下不支持读取实际分辨率";
    NSString *nativeScaleString = @"iOS 8系统以下不支持读取实际比率";
    if ([screen respondsToSelector:@selector(nativeBounds)]) {
        CGFloat width2 = screen.nativeBounds.size.width;
        CGFloat height2 = screen.nativeBounds.size.height;
        nativeSizeString = [NSString stringWithFormat:@"%.0f*%.0f", width2, height2];
        nativeScaleString = [NSString stringWithFormat:@"%.2f", screen.nativeScale];
    }
    
    
    NSString *scaleString = [NSString stringWithFormat:@"%.2f", screen.scale];
    
    RXFunctionItem *item00 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"逻辑宽高" action:nil type:0 object:sizeString];
    RXFunctionItem *item01 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"实际宽高" action:nil type:0 object:nativeSizeString];
    RXFunctionItem *item02 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"逻辑比率" action:nil type:0 object:scaleString];
    RXFunctionItem *item03 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"实际比率" action:nil type:0 object:nativeScaleString];
//    RXFunctionItem *item04 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机型号" action:nil type:0 object:device.model];
    RXFunctionItem *item05 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"iOS系统" action:nil type:0 object:[NSString stringWithFormat:@"%@ %@", device.systemName, device.systemVersion]];
    RXFunctionItem *item06 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机名称" action:nil type:0 object:device.name];
    RXFunctionItem *item07 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机序列号" action:nil type:0 object:device.identifierForVendor.UUIDString];
    
//    RXFunctionItem *item08 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"当前手机号" action:nil type:0 object:[UIDevice rx_currentPhoneNumber]];
    RXFunctionItem *item09 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机型号" action:nil type:0 object:[UIDevice rx_currentDeviceModel]];
    
    self.baseInfoSectionItem.items = @[item00, item01, item02, item03, item05, item06, item07, item09];
    
    
    
    
    
    
    self.functionItems = @[self.appControlSectionItem, self.appInfoSectionItem, self.baseInfoSectionItem];
    
    self.view.backgroundColor = bgColor;
    
}
- (void)initializeAction
{
}


#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
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
