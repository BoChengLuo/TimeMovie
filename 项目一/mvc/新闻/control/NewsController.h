//
//  NewsController.h
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsController : UIViewController
{
    NSMutableArray *_datarr;
    UIImageView *_imageview;
    UILabel *_newlable;
//    __weak IBOutlet UIImageView *_imagev;
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;


@end
