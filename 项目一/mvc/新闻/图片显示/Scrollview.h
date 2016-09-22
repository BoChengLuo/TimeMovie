//
//  Scrollview.h
//  项目一
//
//  Created by wxhl on 16/8/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Scrollview : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imagview;
}
@property(nonatomic,strong)NSURL *url;
@end
