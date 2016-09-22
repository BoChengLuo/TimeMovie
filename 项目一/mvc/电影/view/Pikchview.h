//
//  Pikchview.h
//  项目一
//
//  Created by wxhl on 16/8/31.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionView;
@class HeardCollectionview;

@interface Pikchview : UIView
{
    UIView *_view;
    UIControl *_colview;
    UIButton *_button;
}
@property(nonatomic,strong)CollectionView *collview;
@property(nonatomic,strong)NSMutableArray *atarr;
@property(nonatomic,strong)HeardCollectionview *heardview;
@end
