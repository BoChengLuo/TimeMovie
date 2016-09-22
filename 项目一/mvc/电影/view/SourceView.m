//
//  SourceView.m
//  项目一
//
//  Created by wxhl on 16/9/8.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "SourceView.h"
#import "Datasours.h"
#import "StarView.h"

@implementation SourceView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return  self;
}
-(void)setMovi:(Datasours *)movi{
    if (_movi!=movi) {
        _movi = movi;
        NSString *str = [_movi.images objectForKey:@"large"];
        [_imageview sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"pig"]];
        _titelable.text = _movi.title;
        _orglable.text = _movi.originaltitle;
        _yearlable.text = _movi.year;
        CGFloat x = [_movi.average floatValue];
        _starview.raint = x;
        NSString *st = [NSString stringWithFormat:@"%.1f",_movi.average.floatValue];
        _retaiview.text = st;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
