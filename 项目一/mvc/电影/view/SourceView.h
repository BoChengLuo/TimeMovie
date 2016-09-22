//
//  SourceView.h
//  项目一
//
//  Created by wxhl on 16/9/8.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class Datasours;

@interface SourceView : UIView
{
    
    __weak IBOutlet UIImageView *_imageview;
    __weak IBOutlet UILabel *_titelable;
    __weak IBOutlet UILabel *_orglable;

    __weak IBOutlet UILabel *_yearlable;
    __weak IBOutlet StarView *_starview;
    __weak IBOutlet UILabel *_retaiview;
}
@property(nonatomic,strong)Datasours *movi;
@end
