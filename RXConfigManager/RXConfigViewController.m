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
#import "RXConfigItem.h"
#import "RXCategoryHeader.h"
@interface RXConfigViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>



@property (nonatomic, strong) UIBarButtonItem *bbiCancel;
@property (nonatomic, strong) UIBarButtonItem *bbiSave;



@end

@implementation RXConfigViewController


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


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{

    
    self.bbiCancel = [self bbiWithTitle:@"取消" target:self action:@selector(bbiCancelAction:)];
    self.bbiSave = [self bbiWithTitle:@"保存" target:self action:@selector(bbiSaveAction:)];
    
    self.navigationItem.leftBarButtonItem = self.bbiCancel;
    self.navigationItem.rightBarButtonItem = self.bbiSave;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    
    
    self.title = @"各种信息及调试开关";
    
    
    self.view.backgroundColor = [UIColor rx_colorWithString:@"#f4f4f4"];
    
    [self.view addSubview:self.tableView];
    [self fillAllInSuperView:self.view subView:self.tableView];
    
    
}
- (void)initializeAction
{
    
    UIColor *bgColor = self.view.backgroundColor;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 50;
    
    
    UILabel *sectionTitleLabel = nil;
    RXFunctionItem *item = 0;
    NSMutableArray *array = nil;
    
    // app control
    sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    sectionTitleLabel.backgroundColor = bgColor;
    sectionTitleLabel.text = @"App控制信息";
    
    self.appControlSectionItem = [[RXTVSectionItem alloc] init];
    self.appControlSectionItem.data = sectionTitleLabel;
    self.appControlSectionItem.items = [self allConfigItems];
    
    
    
    
    
    
    
    
    // app info
    array = [NSMutableArray array];

    sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    sectionTitleLabel.backgroundColor = bgColor;
    sectionTitleLabel.text = @"App应用基本信息";
    
    
    
    NSString *object000 = @"";
#if DEBUG
    object000 = @"DEBUG模式";
#else
    object000 = @"RELEASE模式";
#endif
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"编译方式" action:nil type:0 object:object000];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Version" action:nil type:0 object:([RXInfoHelper appVersion])];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Build" action:nil type:0 object:([RXInfoHelper appBuild])];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Identifier" action:nil type:0 object:([RXInfoHelper appBundleIdentifier])];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"应用名称" action:nil type:0 object:([RXInfoHelper appBundleName])];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"应用push" action:nil type:0 object:([RXPushTokenManager lastPushToken])];
    [array addObject:item];
    
    self.appInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.appInfoSectionItem.data = sectionTitleLabel;
    self.appInfoSectionItem.items = array;
    
    
    
    
    
    // iphone base info
    array = [NSMutableArray array];

    sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    sectionTitleLabel.text = @"手机及iOS系统信息";
    sectionTitleLabel.backgroundColor = bgColor;
    
    
    
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
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"逻辑宽高" action:nil type:0 object:sizeString];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"实际宽高" action:nil type:0 object:nativeSizeString];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"逻辑比率" action:nil type:0 object:scaleString];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"实际比率" action:nil type:0 object:nativeScaleString];
    [array addObject:item];

    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"iOS系统" action:nil type:0 object:[NSString stringWithFormat:@"%@ %@", device.systemName, device.systemVersion]];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机名称" action:nil type:0 object:device.name];
    [array addObject:item];
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机序列号" action:nil type:0 object:device.identifierForVendor.UUIDString];
    [array addObject:item];
    
    
    item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机型号" action:nil type:0 object:[UIDevice rx_currentDeviceModel]];
    [array addObject:item];
    
    
    self.baseInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.baseInfoSectionItem.data = sectionTitleLabel;
    self.baseInfoSectionItem.items = array;
    
    self.functionItems = @[self.appControlSectionItem, self.appInfoSectionItem, self.baseInfoSectionItem];
    
    [self.tableView reloadData];
    
}



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
    id item = sectionItem.items[indexPath.row];
    NSString *identify = [RXConfigCell identifier];
    RXConfigCell *cell = (RXConfigCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[RXConfigCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setData:item];
    [cell.mySwitch addTarget:self action:@selector(mySwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
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
    id item = sectionItem.items[indexPath.row];
    if ([item isKindOfClass:[RXFunctionItem class]]) {
        RXFunctionItem *tmp = item;
        SEL action = tmp.action;
        if (action != nil) {
            [self performSelector:action withObject:indexPath afterDelay:0];
        }
    } else if ([item isKindOfClass:[RXConfigItem class]]) {
        RXConfigItem *tmp = item;
        SEL action = tmp.action;
        if (action != nil) {
            [self performSelector:action withObject:indexPath afterDelay:0];
        } else {
            RXConfigItem *tmp = item;
            switch (tmp.e_RX_ConfigType) {
                case kE_RX_ConfigType_Enum:
                {
                    [self enumSelectAction:indexPath];

                }
                    break;
                case kE_RX_ConfigType_Select:
                default:
                {
                    // Do Nothing
                }
                    break;
            }
        }
    } else {
        NSLog(@"Do Nothing");
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




#pragma mark - Need To Override


- (NSArray *)allConfigItems
{
    
    id cm = [RXConfigManager configManagerObject];
    id value = nil;
    
    NSMutableArray *ary = [NSMutableArray array];
    RXConfigItem *item = [[RXConfigItem alloc] init];
    item.title = @"服务器环境";
    item.propertyName = @"e_RX_ServerType";
    value = [cm valueForKey:item.propertyName];
    item.e_RX_ConfigType = kE_RX_ConfigType_Enum;
    item.value = value;
    item.des = NSStringFromE_RX_ServerType((E_RX_ServerType)([value integerValue]));
    item.enumStartIndex = 1;
    item.enumStrAry = @[@"正式环境", @"预发布环境", @"测试环境", @"未定义"];
    [ary addObject:item];
    
    item = [[RXConfigItem alloc] init];
    item.title = @"是否记录网络请求日志";
    item.propertyName = @"isRecordHttpLog";
    value = [cm valueForKey:item.propertyName];
    item.e_RX_ConfigType = kE_RX_ConfigType_Select;
    item.value = value;
    [ary addObject:item];
    
    
    
    
    return ary;
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    NSLog(@"buttonIndex:%zd", buttonIndex);
    RXConfigItem *item = actionSheet.rx_data;
    NSInteger offset = item.enumStartIndex == 0 ? -1 : 0;
    NSInteger selectIndex = (buttonIndex + offset);
    item.value = @(selectIndex);
    item.des = [actionSheet buttonTitleAtIndex:buttonIndex];
    [self.tableView reloadData];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex) {
        return;
    }
    NSLog(@"save");
    id cm = [RXConfigManager configManagerObject];
    for (RXTVSectionItem *sItem in self.functionItems) {
        for (id value in sItem.items) {
            if ([value isKindOfClass:[RXConfigItem class]]) {
                RXConfigItem *tmp = value;
                switch (tmp.e_RX_ConfigType) {
                    case kE_RX_ConfigType_Enum:
                    case kE_RX_ConfigType_Select:
                    {
                        [cm setValue:tmp.value forKey:tmp.propertyName];
                    }
                        break;
                    default:
                        break;
                }
            }
        }
    }
    [cm saveToDisk];
    [[NSNotificationCenter defaultCenter] postNotificationName:NKey_RX_ConfigChanged object:nil];
}

#pragma mark - Action
- (void)bbiCancelAction:(id)sender
{
    if (self.navigationController.topViewController == self) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)bbiSaveAction:(id)sender
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否保存所配置项" delegate:self cancelButtonTitle:@"再想一想" otherButtonTitles:@"保存", nil];
    [av show];
    
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
            tmp.value = @(mySwitch.isOn);
        } else {
            NSLog(@"there hava some error");
        }
    }
}

- (void)enumSelectAction:(id)sender
{
    NSIndexPath *indexPath = sender;
    RXTVSectionItem *sectionItem = self.functionItems[indexPath.section];
    id item = sectionItem.items[indexPath.row];
    if ([item isKindOfClass:[RXConfigItem class]]) {
        RXConfigItem *tmp = item;
        UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil];
        for (NSString *str in tmp.enumStrAry) {
            [as addButtonWithTitle:str];
        }
        as.rx_data = item;
        [as showInView:self.view];
    }
}




#pragma mark - Private
- (void)fillAllInSuperView:(UIView *)superView subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [superView addConstraints:@[lc1, lc2, lc3, lc4]];
    
}


- (UIBarButtonItem *)bbiWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    bbi.tintColor = [UIColor blueColor];
    return bbi;
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
