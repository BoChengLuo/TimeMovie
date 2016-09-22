//
//  Scrollview.m
//  项目一
//
//  Created by wxhl on 16/8/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "Scrollview.h"

@implementation Scrollview
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatview];
        self.maximumZoomScale = 5.0;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = NO;
        UITapGestureRecognizer *toch1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toch1:)];
        toch1.numberOfTapsRequired = 1;
        [self addGestureRecognizer:toch1];
        UITapGestureRecognizer *toch2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toch2:)];
        toch2.numberOfTapsRequired = 2;
        [self addGestureRecognizer:toch2];
        [toch1 requireGestureRecognizerToFail:toch2];
        _imagview.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}
-(void)toch1:(UITapGestureRecognizer *)toch1{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"toch1" object:self];
}
-(void)toch2:(UITapGestureRecognizer *)toch2{
    if (self.zoomScale>1.0) {
        [self setZoomScale:1.0 animated:YES];
    }else{
        [self setZoomScale:4.0 animated:YES];
    }
}

-(void)setUrl:(NSURL *)url{
    _url = url;
    [_imagview sd_setImageWithURL:_url];
}
-(void)creatview{
    _imagview = [[UIImageView alloc]initWithFrame:self.bounds];
//    _imagview.backgroundColor = [UIColor blackColor];
    [self addSubview:_imagview];
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imagview;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
