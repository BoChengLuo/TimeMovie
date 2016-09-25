//
//  PhotoCell.h
//  项目一
//
//  Created by wxhl on 16/9/7.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Datasours;
@class SourceView;

@interface PhotoCell : UICollectionViewCell
{
    UIImageView *_imageview;
    SourceView *_detaview;
    BOOL left;
}
@property(nonatomic,strong)Datasours *movi;
-(void)changeview;
-(void)changeVview;
@end
