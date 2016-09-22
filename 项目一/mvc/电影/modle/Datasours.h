//
//  Datasours.h
//  项目一
//
//  Created by wxhl on 16/8/26.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Datasours : NSObject
//星
@property(nonatomic,copy)NSString *satars;
//名
@property(nonatomic,copy)NSString *title;
//种类
@property(nonatomic,copy)NSString *subtype;
//原标题
@property(nonatomic,copy)NSString *originaltitle;
//电影id
@property(nonatomic,copy)NSString *movieid;
//收藏人数
@property(nonatomic,strong)NSNumber *collctcout;
//图片
@property(nonatomic,copy)NSDictionary *images;
//评分
@property(nonatomic,strong)NSNumber *average;
//时间
@property(nonatomic,copy)NSString *year;
@end
