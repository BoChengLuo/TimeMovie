//
//  TopCell.m
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopCell.h"
#import "modle.h"

@implementation TopCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModata:(modle *)modata{
    if (_modata != modata) {
        _modata = modata;
        [self.imageview sd_setImageWithURL:[NSURL URLWithString:_modata.image]];
        self.textlable.text = _modata.titleCn;
        NSString *str = [_modata.directors componentsJoinedByString:@""];
        self.namelable.text = str;
        NSString *str1 = [_modata.actors componentsJoinedByString:@","];
        self.titelable.text = str1;
        NSString *str2 = [_modata.type componentsJoinedByString:@","];
        self.xxlable.text = str2;
        NSString *str3 = [_modata.releas objectForKey:@"location"];
        NSString *str4 = [_modata.releas objectForKey:@"date"];
        NSString *str5 = [NSString stringWithFormat:@"%@ %@",str3,str4];
        self.yearlable.text = str5;
        
    }
}
/*
 NSMutableString * string = [[NSMutableString alloc] init];
 
 for（NSString * str in strArray）{
 
 [string stringByAppendingString:str];
 
 }
 */
//NSString *string = [array componentsJoinedByString:@","];--分隔符
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
