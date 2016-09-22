//
//  IndexCell.m
//  项目一
//
//  Created by wxhl on 16/9/8.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "IndexCell.h"
#import "Datasours.h"

@implementation IndexCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatview];
    }
    return self;
}
-(void)creatview{
    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width*0.95, self.bounds.size.height*0.95)];
    _imageview.backgroundColor = [UIColor greenColor];
    _imageview.center = self.contentView.center;
    [self.contentView addSubview:_imageview];
}
-(void)setUrl:(NSString *)url{
    if (_url != url) {
        _url = url;
        [_imageview sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"pig"]];
    }
    
}

@end
