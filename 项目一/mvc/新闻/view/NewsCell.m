//
//  NewsCell.m
//  项目一
//
//  Created by wxhl on 16/8/28.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModle.h"
//#import "UIImageView+WebCache.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setData:(NewsModle *)Data{
    _Data = Data;
    _lablenage.text = self.Data.title;
    lablenew.text = self.Data.summary;
    lablenew.textColor = [UIColor orangeColor];
    lablenew.transform = CGAffineTransformIdentity;
    NSString *str = self.Data.image;
    NSURL *url = [NSURL URLWithString:str];
    [_imageName sd_setImageWithURL:url];
    _type = [self.Data.type integerValue];
    _imagepic.image = [UIImage imageNamed:@"sctpxw@2x.png"];
    if (_type == 1) {
        _imagepic.hidden = NO;
    }else if(_type == 0){
        _imagepic.hidden = YES;
        NSInteger n = lablenew.frame.origin.x - _imagepic.frame.origin.x;
        lablenew.transform = CGAffineTransformMakeTranslation(-n, 0);
    }else {
        _imagepic.hidden = NO;
        _imagepic.image = [UIImage imageNamed:@"scspxw@2x.png"];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
