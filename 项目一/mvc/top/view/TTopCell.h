//
//  TTopCell.h
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class modle;

@interface TTopCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iimageview;

@property (weak, nonatomic) IBOutlet UIImageView *iimageview1;
@property (weak, nonatomic) IBOutlet UIImageView *iimageview2;
@property (weak, nonatomic) IBOutlet UIImageView *iimageview3;
@property(nonatomic,strong)modle *modata;

@end
