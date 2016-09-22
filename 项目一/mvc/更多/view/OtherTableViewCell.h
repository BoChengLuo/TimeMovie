//
//  OtherTableViewCell.h
//  项目一
//
//  Created by wxhl on 16/9/11.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Moremodle;

@interface OtherTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Imageview;

@property (weak, nonatomic) IBOutlet UILabel *textView;
@property(nonatomic,strong)Moremodle *data;
@end
