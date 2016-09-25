//
//  Collectionview.m
//  项目一
//
//  Created by wxhl on 16/8/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "Collectionview.h"
#import "ViewCell.h"
#import "Scrollview.h"

@implementation Collectionview
-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.itemSize = CGSizeMake(KScreenWidth, KScreenHeight);
    self = [super initWithFrame:frame collectionViewLayout:flow];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.pagingEnabled = YES;
        self.bounces = NO;
        flow.minimumLineSpacing = 0;
        [self registerClass:[ViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    ViewCell *cel = (ViewCell *)cell;
    [cel.scrollview setZoomScale:1.0 animated:YES];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imagarr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.str = _imagarr[indexPath.row];
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
