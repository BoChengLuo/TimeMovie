//
//  TableViewCell.m
//  项目一
//
//  Created by wxhl on 16/8/26.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TableViewCell.h"
#import "Datasours.h"
#import "UIImageView+WebCache.h"


@implementation TableViewCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}
//-(void)setData:(Datasours *)data
-(void)setData1:(Datasours *)data1{
    _data1 = data1;
    titlelable.text = self.data1.title;
    slable.text = [NSString stringWithFormat:@"%.2f",[self.data1.average floatValue]];
    yearlable.text = [NSString stringWithFormat:@"年份:%@",self.data1.year];
    NSString *small = [self.data1.images objectForKey:@"small"];
    NSURL *url = [NSURL URLWithString:small];
//    [imgeaview sd_setImageWithURL:url];
    [imgeaview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig.png"]];
//    StarView  *star = [[StarView alloc]init];
    self.star.raint = [self.data1.average floatValue];
//    star.backgroundColor = [UIColor clearColor];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
