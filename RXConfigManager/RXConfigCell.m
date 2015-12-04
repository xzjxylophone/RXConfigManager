//
//  RXConfigCell.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/30.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigCell.h"
#import "RXFunctionItem.h"
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
        [self.contentView addSubview:self.lblLeft];
        [self.contentView addSubview:self.lblRight];
        self.frame = CGRectMake(0, 0, width, height);
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 50;
}

@end
