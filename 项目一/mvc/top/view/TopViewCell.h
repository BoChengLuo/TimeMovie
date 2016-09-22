//
//  TopViewCell.h
//  项目一
//
//  Created by wxhl on 16/8/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class Datasours;
@class Tableview;
@interface TopViewCell : UICollectionViewCell
{
    __weak IBOutlet UIImageView *_imagview;
    __weak IBOutlet UILabel *_lableName;
    
    __weak IBOutlet StarView *_starview;
    __weak IBOutlet UILabel *_labelretain;
}
@property(nonatomic,strong)Datasours *data;
@property(nonatomic,strong)Tableview *tableview;
@end
