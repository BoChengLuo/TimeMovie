//
//  Moretableview.m
//  项目一
//
//  Created by wxhl on 16/9/11.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "Moretableview.h"
#import "Moremodle.h"
#import "MoreTableViewCell.h"
#import "OtherTableViewCell.h"

@implementation Moretableview
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.bounces = NO;
        [self creatdata];
        [self countCacheSize];
        self.backgroundColor = [UIColor blackColor];
//        self.style = [UITableViewCellStyleDefault];
//        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}
-(void)countCacheSize{
    NSUInteger filiteger = [[SDImageCache sharedImageCache]getSize];
    _string = [NSString stringWithFormat:@"%.1f MB",filiteger/1024/1024.0];
}

-(void)creatdata{
    Moremodle *mod1 = [[Moremodle alloc]init];
    Moremodle *mod2 = [[Moremodle alloc]init];
    Moremodle *mod3 = [[Moremodle alloc]init];
    Moremodle *mod4 = [[Moremodle alloc]init];
    Moremodle *mod5 = [[Moremodle alloc]init];
    Moremodle *mod6 = [[Moremodle alloc]init];
    UIImage *image0 = [UIImage imageNamed:@"moreClear@2x"];
    UIImage *image2 = [UIImage imageNamed:@"moreScore@2x"];
    UIImage *image3 = [UIImage imageNamed:@"moreVersion@2x"];
    UIImage *image4 = [UIImage imageNamed:@"moreBusiness@2x"];
    UIImage *image5 = [UIImage imageNamed:@"moreWelcome@2x"];
    UIImage *image6 = [UIImage imageNamed:@"moreAbout@2x"];
    NSString *str1 = [NSString stringWithFormat:@"清除缓存"];
    NSString *str2 = [NSString stringWithFormat:@"给个评价"];
    NSString *str3 = [NSString stringWithFormat:@"你开心就好"];
    NSString *str4 = [NSString stringWithFormat:@"我不开心"];
    NSString *str5 = [NSString stringWithFormat:@"不开心也没办法"];
    NSString *str6 = [NSString stringWithFormat:@"眼睛都花了"];
    mod1.image = image0;
    mod1.text = str1;
    mod2.image = image2;
    mod2.text = str2;
    mod3.image = image3;
    mod3.text = str3;
    mod4.image = image4;
    mod4.text = str4;
    mod5.image = image5;
    mod5.text = str5;
    mod6.image = image6;
    mod6.text = str6;
    _datarry = [NSArray array];
    _datarry = @[mod1,mod2,mod3,mod4,mod5,mod6];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datarry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MoreTableViewCell" owner:self options:nil]lastObject];
            cell.data = _datarry[indexPath.row];
            cell.retainlable.text = _string;
            cell.backgroundColor =[UIColor clearColor];
        }
        return cell;
    }else{
        OtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ccell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OtherTableViewCell" owner:self options:nil]lastObject];
            cell.data = _datarry[indexPath.row];
            cell.backgroundColor = [UIColor clearColor];
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"提示" message:@"香水有毒" delegate:self cancelButtonTitle:@"搞" otherButtonTitles:@"不搞", nil];
        [view show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [[SDImageCache sharedImageCache]clearDisk];
        [self countCacheSize];
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
