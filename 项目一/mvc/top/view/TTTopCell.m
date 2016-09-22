//
//  TTTopCell.m
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TTTopCell.h"
#import "modle.h"

@implementation TTTopCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModata:(modle *)modata{
    if (_modata != modata) {
        _modata = modata;
        NSString *str = _modata.userImage;
        [_iiimageview sd_setImageWithURL:[NSURL URLWithString:str]];
        self.namelable.text = _modata.nickname;
        self.retailable.text = _modata.rating;
        self.lable.text = _modata.content;
//        [self.lable sizeToFit];
//        self.lable.frame.size.height = self.lable.numberOfLines*30;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
