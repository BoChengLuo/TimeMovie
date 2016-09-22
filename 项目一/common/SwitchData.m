//
//  SwitchData.m
//  项目一
//
//  Created by wxhl on 16/8/28.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "SwitchData.h"

@implementation SwitchData
+(instancetype)SwitchData:(NSString *)fil{
    NSString *stringfil = [[NSBundle mainBundle]pathForResource:fil ofType:NULL];
    NSData *DATA = [NSData dataWithContentsOfFile:stringfil];
    id json = [NSJSONSerialization JSONObjectWithData:DATA options:NSJSONReadingMutableContainers error:nil];
    return json;
}
@end
