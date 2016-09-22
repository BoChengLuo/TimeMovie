//
//  CollectionView.m
//  项目一
//
//  Created by wxhl on 16/9/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "CollectionView.h"
#import "PhotoCell.h"
#import "Datasours.h"

@implementation CollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self = [super initWithFrame:frame collectionViewLayout:flow];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
        flow.minimumLineSpacing = 0;
        self.bounces = NO;
//        self.pagingEnabled = 0;
        UIImage *image = [UIImage imageNamed:@"indexBG_home@2x.png"];
        flow.itemSize = CGSizeMake(KScreenWidth-100, KScreenHeight-64-49-image.size.height);
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat x = (CGRectGetWidth(self.frame)-(KScreenWidth-100))/2;
    return UIEdgeInsetsMake(0, x, 0, x);
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    int indext = (targetContentOffset->x + (KScreenWidth-100)/2)/(KScreenWidth-100);
    targetContentOffset->x = indext*(KScreenWidth-100);
    self.mmi = indext;
//    NSLog(@"%li",self.mmi);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mmi == indexPath.row) {
        PhotoCell *cell = (PhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell changeview];
    }else{
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    self.mmi = indexPath.row;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _movarr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//        cell.frame = CGRectMake(10+indexPath.row*cell.bounds.size.width+indexPath.row*20, 30, KScreenWidth-30, KScreenHeight-30);
    cell.backgroundColor = [UIColor clearColor];
    cell.movi = _movarr[indexPath.row];
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
