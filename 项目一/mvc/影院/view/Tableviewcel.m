//
//  Tableviewcel.m
//  项目一
//
//  Created by wxhl on 16/9/24.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "Tableviewcel.h"
#import "Moviemodel.h"

@implementation Tableviewcel
-(void)setData:(Moviemodel *)data{
    _data = data;
    name.text = self.data.name;
    couponsuport.image = [UIImage imageNamed:@"cinemaCouponMark@2x.png"];
    seatsupport.image = [UIImage imageNamed:@"cinemaSeatMark@2x.png"];
    addressimage.image = [UIImage imageNamed:@"distanceIcon@2x.png"];
    if (data.circleName != nil) {
        
//        circleName.text = self.data.circleName;
    }
    address.text = self.data.address;
    lowprice.text = [NSString stringWithFormat:@"¥:%@元起",self.data.lowPrice];
    telimage.image = [UIImage imageNamed:@"grayPhoneIcon@2x.png"];
    tellable.text = self.data.tel;
}

@end
