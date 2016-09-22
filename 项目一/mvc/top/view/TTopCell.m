//
//  TTopCell.m
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TTopCell.h"
#import "modle.h"

@implementation TTopCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor redColor];
    // Initialization code
}
-(void)setModata:(modle *)modata{
    if (_modata != modata) {
        _modata = modata;
        NSString *str = _modata.images[0];
        NSString *str1 = _modata.images[1];
        NSString *str2 = _modata.images[2];
        NSString *str3 = _modata.images[3];
        [_iimageview sd_setImageWithURL:[NSURL URLWithString:str]];
        [_iimageview1 sd_setImageWithURL:[NSURL URLWithString:str1]];
        [_iimageview2 sd_setImageWithURL:[NSURL URLWithString:str2]];
        [_iimageview3 sd_setImageWithURL:[NSURL URLWithString:str3]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
