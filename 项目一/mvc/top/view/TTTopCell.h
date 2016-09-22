//
//  TTTopCell.h
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class modle;

@interface TTTopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iiimageview;
@property (weak, nonatomic) IBOutlet UILabel *namelable;
@property (weak, nonatomic) IBOutlet UILabel *retailable;
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property(nonatomic,strong)modle *modata;

@end
