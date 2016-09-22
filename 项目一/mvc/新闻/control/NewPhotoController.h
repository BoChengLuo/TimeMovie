//
//  NewPhotoController.h
//  项目一
//
//  Created by wxhl on 16/8/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModle;

@interface NewPhotoController : UIViewController
{
    
    __weak IBOutlet UICollectionView *collectionview;
}
@property(nonatomic,strong)NSMutableArray *Photoarr;
@property(nonatomic,strong)NewsModle *modle;
@end
