//
//  MoreTableViewCell.m
//  项目一
//
//  Created by wxhl on 16/9/11.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "Moremodle.h"

@implementation MoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setData:(Moremodle *)data{
    if (_data!=data) {
        _data=data;
        self.imageView.image = _data.image;
        self.texlable.text = _data.text;
        self.texlable.textColor = [UIColor whiteColor];
        self.retainlable.textColor = [UIColor whiteColor];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
