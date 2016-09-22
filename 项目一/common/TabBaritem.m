//
//  TabBaritem.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TabBaritem.h"

@implementation TabBaritem
-(instancetype)initWithFrame:(CGRect)frame imagName:(NSString *)imagName titletext:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self !=nil) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-20)/2, 5, 20, 20)];
        imageview.image = [UIImage imageNamed:imagName];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageview];
        CGFloat maxY = CGRectGetMaxY(imageview.frame);
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, maxY, frame.size.width, 20)];
        lable.text = text;
//        NSDictionary *labletext = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]};
//        lable = labletext;
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:14];
        lable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lable];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
