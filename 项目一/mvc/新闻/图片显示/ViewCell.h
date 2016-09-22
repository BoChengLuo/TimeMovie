//
//  ViewCell.h
//  项目一
//
//  Created by wxhl on 16/8/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Scrollview;

@interface ViewCell : UICollectionViewCell
@property(nonatomic,copy)NSString *str;
@property(nonatomic,strong)Scrollview *scrollview;
@end
