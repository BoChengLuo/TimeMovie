//
//  MovieController.h
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Pikchview;

@interface MovieController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_proview;
    Pikchview *_lroview;
    NSMutableArray *_datarr;
    
}

@end
