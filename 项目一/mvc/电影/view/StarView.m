//
//  StarView.m
//  项目一
//
//  Created by wxhl on 16/8/27.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "StarView.h"

@implementation StarView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}
-(void)awakeFromNib{
    [self creatView];
}
-(void)creatView{
    self.backgroundColor = [UIColor clearColor];
    _yellow = [[UIView alloc]init];
    UIImage *image1 = [UIImage imageNamed:@"yellow@2x.png"];
    UIImage *image2 = [UIImage imageNamed:@"gray@2x.png"];
    _yellow.frame = CGRectMake(0, 0, image1.size.width*5, image1.size.height);
    _yellow.backgroundColor = [UIColor colorWithPatternImage:image1];
    CGFloat s = self.frame.size.height/image1.size.height;
    CGFloat x = self.frame.size.width/_yellow.frame.size.width;
    _yellow.transform = CGAffineTransformMakeScale(x, s);
//    _yellow.frame = CGRectMake(0, 0, _yellow.frame.size.width, _yellow.frame.size.height);
    _grya = [[UIView alloc]init];
    _grya.frame = CGRectMake(0, 0, image1.size.width*5, image1.size.height);
    _grya.backgroundColor = [UIColor colorWithPatternImage:image2];
    _grya.transform = CGAffineTransformMakeScale(x, s);
    _grya.frame = CGRectMake(0, 0, _grya.frame.size.width, _grya.frame.size.height);
    [self addSubview:_grya];
    [self addSubview:_yellow];
}
-(void)setRaint:(CGFloat)raint{
//    _yellow.transform = CGAffineTransformIdentity;
    _yellow.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _raint = raint;
    CGFloat s =raint/10;
    _yellow.frame = CGRectMake(0, 0, _yellow.frame.size.width*s, _yellow.frame.size.height);
    
}
//有bug需要调整

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
