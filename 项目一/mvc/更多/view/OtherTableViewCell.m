//
//  OtherTableViewCell.m
//  项目一
//
//  Created by wxhl on 16/9/11.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "OtherTableViewCell.h"
#import "Moremodle.h"

@implementation OtherTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setData:(Moremodle *)data{
    if (_data!=data) {
        _data = data;
        self.Imageview.image = _data.image;
        self.textView.text = _data.text;
        self.textView.textColor = [UIColor whiteColor];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
