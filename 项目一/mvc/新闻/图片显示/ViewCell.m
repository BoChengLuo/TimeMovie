//
//  ViewCell.m
//  项目一
//
//  Created by wxhl on 16/8/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "ViewCell.h"
#import "Scrollview.h"

@implementation ViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        self.backgroundColor = [UIColor grayColor];
        [self creaimageview];
    }
    return self;
}
-(void)setStr:(NSString *)str{
    _str = str;
    _scrollview.url = [NSURL URLWithString:_str];
}
-(void)creaimageview{
    _scrollview = [[Scrollview alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    [self addSubview:_scrollview];
}

@end
