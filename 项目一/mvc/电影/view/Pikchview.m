//
//  Pikchview.m
//  项目一
//
//  Created by wxhl on 16/8/31.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "Pikchview.h"
#import "CollectionView.h"
#import "HeardCollectionview.h"

@implementation Pikchview
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        [self creatview];
        [self creatheardview];
        UIImage *image = [UIImage imageNamed:@"indexBG_home@2x.png"];
        _collview = [[CollectionView alloc]initWithFrame:CGRectMake(0, 64+image.size.height, KScreenWidth, KScreenHeight-64-49-image.size.height)];
        [self insertSubview:_collview belowSubview:_colview];
        [_collview addObserver:self forKeyPath:@"mmi" options:NSKeyValueObservingOptionNew context:nil];
        [_heardview addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"mmi"] && object == _collview && _collview.mmi != _heardview.index) {
        NSNumber *item = [change objectForKey:@"new"];
        NSInteger i = [item integerValue];
        _heardview.index = i;
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        [_heardview scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }else
        if ([keyPath isEqualToString:@"index"]) {
        NSNumber *item = [change objectForKey:@"new"];
        NSInteger i = [item integerValue];
        _collview.mmi = i;
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        [_collview scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}
-(void)creatheardview{
    _heardview = [[HeardCollectionview alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
//    _heardview.backgroundColor = [UIColor redColor];
    [_view addSubview:_heardview];
}
-(void)setAtarr:(NSMutableArray *)datarr{
    if (_atarr != datarr) {
        _atarr = datarr;
        [_collview setMovarr:datarr];
        [_heardview setData:datarr];
    }
}
-(void)creatview{
    UIImage *image = [UIImage imageNamed:@"indexBG_home@2x.png"];
    CGFloat x = KScreenWidth/image.size.width;
    image = [image stretchableImageWithLeftCapWidth:1/x topCapHeight:0];
    _view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, image.size.height+64)];
    _view.backgroundColor = [UIColor clearColor];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, image.size.height)];
    imageview.image = image;
    [_view addSubview:imageview];
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *imagbutd = [UIImage imageNamed:@"down_home@2x.png"];
        UIImage *imagbutu = [UIImage imageNamed:@"up_home@2x.png"];
        _button.frame = CGRectMake((KScreenWidth-imagbutd.size.width)/2,_view.frame.size.height-imagbutd.size.height, imagbutd.size.width, imagbutd.size.height);
//        _button.backgroundColor = [UIColor orangeColor];
        [_button setImage:imagbutd forState:UIControlStateNormal];
        [_button setImage:imagbutu forState:UIControlStateSelected];
        [_button addTarget:self action:@selector(buttonaction:) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:_button];
    UIView *coview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    coview.backgroundColor = [UIColor grayColor];
    coview.tag = 200;
    [_view addSubview:coview];
    [self addSubview:_view];
    _colview = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    _colview.backgroundColor = [UIColor colorWithWhite:1 alpha:.5];
    [_colview addTarget:self action:@selector(controlaction:) forControlEvents:UIControlEventTouchUpInside];
    _colview.hidden = YES;
    [self insertSubview:_colview belowSubview:_view];
}
-(void)buttonaction:(UIButton *)but{
    if (but.selected) {
        [UIView animateWithDuration:.3 animations:^{
            _view.transform = CGAffineTransformIdentity;
            _colview.hidden = YES;
        }];
        
    }else{
        [UIView animateWithDuration:.3 animations:^{
            _view.transform = CGAffineTransformMakeTranslation(0, 64);
            _colview.hidden = NO;
        }];
    }
    but.selected = !but.selected;
}
-(void)controlaction:(UIControl *)control{
    if (_button.selected) {
        [UIView animateWithDuration:.3 animations:^{
            _view.transform = CGAffineTransformIdentity;
            _colview.hidden = YES;
            _button.selected = !_button.selected;
        }];
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
