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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    NSMutableArray *ary = [NSMutableArray arrayWithArray:self.appControlSectionItem.items];
    
    RXFunctionItem *item = [[RXFunctionItem alloc] initWithIconName:@"" title:@"是否是test" action:nil type:0];
    [ary addObject:item];
    
    self.appControlSectionItem.items = ary;
    
    
    [[MVConfigManager sharedInstance] allProperty];
    
    
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
