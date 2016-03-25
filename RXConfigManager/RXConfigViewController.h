//
//  RXConfigViewController.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/23.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RXTVSectionItem;



@interface RXConfigViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;


@property (nonatomic, strong) NSArray *functionItems;

// 手机系统和手机的信息, 类似于设置中的关于本机
@property (nonatomic, strong) RXTVSectionItem *baseInfoSectionItem;

// App的信息
@property (nonatomic, strong) RXTVSectionItem *appInfoSectionItem;

// App 控制信息
@property (nonatomic, strong) RXTVSectionItem *appControlSectionItem;

- (void)initializeUIAndData;
- (void)initializeAction;

- (void)enumSelectAction:(id)sender;


#pragma mark - Need To Override


- (NSArray *)allConfigItems;



@end
