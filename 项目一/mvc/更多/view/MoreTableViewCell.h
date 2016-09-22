//
//  MoreTableViewCell.h
//  项目一
//
//  Created by wxhl on 16/9/11.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Moremodle;

@interface MoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *texlable;
@property (weak, nonatomic) IBOutlet UILabel *retainlable;
@property(nonatomic,strong)Moremodle *data;
@end
