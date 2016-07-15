//
//  RXConfigCell.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/30.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigCell.h"
#import "RXFunctionItem.h"
#import "RXConfigItem.h"
@interface RXConfigCell ()

@property (nonatomic, strong) UILabel *lblLeft;
@property (nonatomic, strong) UILabel *lblRight;


@end

@implementation RXConfigCell
- (void)setData:(id)data
{
    if ([data isKindOfClass:[RXFunctionItem class]]) {
        RXFunctionItem *tmp = data;
        self.lblLeft.text = [NSString stringWithFormat:@"%@:", tmp.title];
        if ([tmp.object isKindOfClass:[NSString class]]) {
            self.lblRight.text = tmp.object;
        }
        
        self.lblRight.hidden = NO;
        self.mySwitch.hidden = YES;
    } else if ([data isKindOfClass:[RXConfigItem class]]) {
        RXConfigItem *tmp = data;
        self.lblLeft.text = [NSString stringWithFormat:@"%@:", tmp.title];
        
        switch (tmp.e_RX_ConfigType) {
            case kE_RX_ConfigType_Enum:
            {
                self.lblRight.text = tmp.des;
                self.lblRight.hidden = NO;
                self.mySwitch.hidden = YES;
            }
                break;
            case kE_RX_ConfigType_Select:
            {
                self.lblRight.text = @"";
                self.lblRight.hidden = YES;
                self.mySwitch.hidden = NO;
                
                BOOL value = [tmp.value boolValue];
                [self.mySwitch setOn:value];
            }
                break;
            default:
                break;
        }
        
        
    } else {
        
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [RXConfigCell cellHeight];
        CGFloat lblLeftX = 10;
        CGFloat lblLeftWidth = 100;
        CGFloat lblRightX = lblLeftX + lblLeftWidth;
        CGFloat lblRightWidth = width - lblRightX - lblLeftX;
        self.lblLeft = [[UILabel alloc] initWithFrame:CGRectMake(lblLeftX, 0, lblLeftWidth, height)];
        self.lblLeft.numberOfLines = 0;
        self.lblRight = [[UILabel alloc] initWithFrame:CGRectMake(lblRightX, 0, lblRightWidth, height)];
        self.lblRight.numberOfLines = 0;
        
        CGFloat myWidth = 50;
        CGFloat myHeight = 30;
        CGFloat myX = width - myWidth - 20;
        CGFloat myY = (height - myHeight) / 2.0f;
        self.mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(myX, myY, myWidth, myHeight)];
        
        
        [self.contentView addSubview:self.lblLeft];
        [self.contentView addSubview:self.lblRight];
        [self.contentView addSubview:self.mySwitch];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 75;
}

@end
