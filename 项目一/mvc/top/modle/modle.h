//
//  modle.h
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface modle : NSObject
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *titleCn;
@property(nonatomic,copy)NSArray *directors;
@property(nonatomic,copy)NSArray *actors;
@property(nonatomic,copy)NSArray *type;
@property(nonatomic,copy)NSDictionary *releas;
@property(nonatomic,copy)NSArray *images;
@property(nonatomic,copy)NSString *userImage;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *content;

@end
/*
	"count" : 25,
	"list" : [
 {
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "yangna988",
 "rating" : "9.0",
 "content" : "儿子很喜欢 一直期盼上映"
 },
*/