//
//  HeardCollectionview.m
//  项目一
//
//  Created by wxhl on 16/9/8.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "HeardCollectionview.h"
#import "IndexCell.h"
#import "Datasours.h"

@implementation HeardCollectionview
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self = [super initWithFrame:frame collectionViewLayout:flow];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        flow.minimumLineSpacing = 0;
        flow.itemSize = CGSizeMake(75, 64);
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:@"indexcell"];
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat x = (CGRectGetWidth(self.frame) - 75)/2.0;
    return UIEdgeInsetsMake(0, x, 0, x);
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSInteger index = (targetContentOffset->x + 75/2.0)/75;
    targetContentOffset->x = index*75;
    self.index = index;
    NSLog(@"index------%li",self.index);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.index!=indexPath.row) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    self.index = indexPath.row;

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"indexcell" forIndexPath:indexPath];
    Datasours *movie = _data[indexPath.row];
    NSString *str = [movie.images objectForKey:@"large"];
//    cell.backgroundColor = [UIColor greenColor];
    cell.url =str;
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
