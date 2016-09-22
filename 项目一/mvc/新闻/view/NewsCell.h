//
//  NewsCell.h
//  项目一
//
//  Created by wxhl on 16/8/28.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModle;

@interface NewsCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imageName;
    
    __weak IBOutlet UIImageView *_imagepic;
    __weak IBOutlet UILabel *_lablenage;
    __weak IBOutlet UILabel *lablenew;
    
}
@property(nonatomic,strong)NewsModle *Data;
@property(nonatomic,assign)NSInteger type;

@end
