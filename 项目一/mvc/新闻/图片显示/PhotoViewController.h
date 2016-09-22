//
//  PhotoViewController.h
//  项目一
//
//  Created by wxhl on 16/8/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionView;
@interface PhotoViewController : UIViewController{
    BOOL _ishidden;
}
@property(nonatomic,strong)NSArray *imaarr;
@property(nonatomic,strong)NSIndexPath *index;
@end
