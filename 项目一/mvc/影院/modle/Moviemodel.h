//
//  Moviemodel.h
//  项目一
//
//  Created by wxhl on 16/9/24.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Moviemodel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *circleName;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *lowPrice;
@property(nonatomic,copy)NSString *tel;
@end
/*
 __weak IBOutlet UILabel *name;
 __weak IBOutlet UIImageView *couponsuport;
 __weak IBOutlet UIImageView *seatsupport;
 __weak IBOutlet UIImageView *addressimage;
 __weak IBOutlet UILabel *circleName;
 
 __weak IBOutlet UILabel *address;
 __weak IBOutlet UILabel *lowprice;
 __weak IBOutlet UIImageView *telimage;
 __weak IBOutlet UILabel *tellable;
 
 "lowPrice" : "40.00",
 "grade" : "8.8",
 "coord" : "116.36047,40.01433",
 "distance" : null,
 "address" : "北京市海淀区学清路甲8号，圣熙8号购物中心五层西侧。",
 "name" : "嘉华国际影城",
 "id" : "1396",
 "msg" : null,
 "districtId" : "1015",
 "tel" : "010-82732228",
 "isSeatSupport" : "1",
 "isCouponSupport" : "1",
 "isImaxSupport" : "0",
 "isGroupBuySupport" : "0",
 "circleName" : "五道口"
 }, {
 
 */

