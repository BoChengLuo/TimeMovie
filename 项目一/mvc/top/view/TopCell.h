//
//  TopCell.h
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class modle;

@interface TopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *textlable;
@property (weak, nonatomic) IBOutlet UILabel *namelable;
@property (weak, nonatomic) IBOutlet UILabel *titelable;

@property (weak, nonatomic) IBOutlet UILabel *xxlable;
@property (weak, nonatomic) IBOutlet UILabel *yearlable;
@property(nonatomic,strong)modle *modata;
@end
