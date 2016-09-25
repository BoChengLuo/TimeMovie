//
//  PhotoCell.m
//  项目一
//
//  Created by wxhl on 16/9/7.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "PhotoCell.h"
#import "Datasours.h"
#import "SourceView.h"

@implementation PhotoCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatview];
    }
    return self;
}
-(void)creatview{
    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, self.bounds.size.width-10, self.bounds.size.height-20)];
//    _imageview.hidden = YES;
    _detaview = [[[NSBundle mainBundle]loadNibNamed:@"View" owner:self options:nil]lastObject];
    _detaview.frame = CGRectMake(5, 10, self.bounds.size.width-10, self.bounds.size.height-20);
    _detaview.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_imageview];
    [self.contentView insertSubview:_detaview belowSubview:_imageview];
}
-(void)setMovi:(Datasours *)movi{
    if (_movi!=movi) {
        _movi = movi;
        NSString *str = [movi.images objectForKey:@"large"];
        NSURL *url = [NSURL URLWithString:str];
        [_imageview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
        [_detaview setMovi:_movi];
    }
}
-(void)changeview{
    UIViewAnimationOptions lef = left?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    NSInteger index1 = [self.contentView.subviews indexOfObject:_imageview];
    NSInteger index2 = [self.contentView.subviews indexOfObject:_detaview];
    [UIView transitionWithView:self duration:.3 options:lef animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    } completion:nil];
    left = !left;
}
-(void)changeVview{
NSInteger index1 = [self.contentView.subviews indexOfObject:_imageview];
NSInteger index2 = [self.contentView.subviews indexOfObject:_detaview];
    if (index2>index1) {
        
        [UIView transitionWithView:self duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            if (index2 >index1) {
                
                [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
            }
        } completion:nil];
    }
}

@end
