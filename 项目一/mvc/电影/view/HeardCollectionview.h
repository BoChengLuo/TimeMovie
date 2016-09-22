//
//  HeardCollectionview.h
//  项目一
//
//  Created by wxhl on 16/9/8.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeardCollectionview : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,assign)NSInteger index;

@end
