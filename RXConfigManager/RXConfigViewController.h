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


// App 控制信息
@property (nonatomic, strong) RXTVSectionItem *appControlSectionItem;


// App的信息,版本号,编译模式,版本identify,应用名称啊等等
@property (nonatomic, strong) RXTVSectionItem *appInfoSectionItem;



// 手机系统和手机的信息, 类似于设置中的关于本机,屏幕宽高,系统手机名称等等
@property (nonatomic, strong) RXTVSectionItem *baseInfoSectionItem;


// maybe need to override
- (void)initializeUIAndData;
- (void)initializeAction;

- (void)enumSelectAction:(id)sender;


#pragma mark - Need To Override
// 子类继承然后去重写它
- (NSArray *)allConfigItems;



@end
