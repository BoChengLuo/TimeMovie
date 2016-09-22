//
//  TopViewCell.m
//  项目一
//
//  Created by wxhl on 16/8/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopViewCell.h"
#import "Datasours.h"
#import "StarView.h"

@implementation TopViewCell
-(void)setData:(Datasours *)data{
    _data = data;
    _lableName.text = self.data.title;
    _lableName.textColor = [UIColor whiteColor];
    _starview.raint = [self.data.average floatValue];
    _labelretain.text = [NSString stringWithFormat:@"%.1f",[self.data.average floatValue]];
    _labelretain.textColor = [UIColor whiteColor];
    NSString *str = [self.data.images objectForKey:@"small"];
    NSURL *url = [NSURL URLWithString:str];
    [_imagview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig.png"]];
//    [_imagview sd_setImageWithURL:url];
}
@end
