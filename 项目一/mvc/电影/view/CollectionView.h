//
//  CollectionView.h
//  项目一
//
//  Created by wxhl on 16/9/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectview;
}
@property(nonatomic,strong)NSMutableArray *movarr;
@property(nonatomic,assign)NSInteger mmi;
@end
