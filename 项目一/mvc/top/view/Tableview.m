//
//  Tableview.m
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "Tableview.h"
#import "TopCell.h"
#import "TTopCell.h"
#import "TTTopCell.h"
#import "modle.h"

@implementation Tableview
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.rowHeight = 70;
        [self creatData];
    }
    return self;
}
/*
 @property(nonatomic,copy)NSString *titleCn;
 @property(nonatomic,copy)NSArray *directors;
 @property(nonatomic,copy)NSArray *actors;
 @property(nonatomic,copy)NSArray *type;
 @property(nonatomic,copy)NSString *location;
 @property(nonatomic,copy)NSString *date;
 @property(nonatomic,copy)NSArray *images;
 @property(nonatomic,copy)NSString *userImage;
 @property(nonatomic,copy)NSString *nickname;
 @property(nonatomic,copy)NSString *rating;
 @property(nonatomic,copy)NSString *content;
 */
-(void)creatData{
    NSString *fil1 = [[NSBundle mainBundle]pathForResource:@"movie_detail" ofType:@"json"];
    NSData *data1 = [NSData dataWithContentsOfFile:fil1];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingMutableContainers error:nil];
    NSString *fil2 = [[NSBundle mainBundle]pathForResource:@"movie_comment" ofType:@"json"];
    NSData *data2 = [NSData dataWithContentsOfFile:fil2];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:nil];
    NSArray *arr = [dict objectForKey:@"list"];
    _datarr = [NSMutableArray array];
    for (NSDictionary *dicc in arr) {
        modle *modl = [[modle alloc]init];
        modl.image = [dic objectForKey:@"image"];
        modl.titleCn = [dic objectForKey:@"titleCn"];
        NSArray *arr = [dic objectForKey:@"directors"];
        modl.directors = arr;
        NSArray *arr1 = [dic objectForKey:@"actors"];
        modl.actors = arr1;
        NSArray *arr2 = [dic objectForKey:@"type"];
        modl.type = arr2;
        modl.releas  = [dic objectForKey:@"release"];;
        NSArray *arr3 = [dic objectForKey:@"images"];
        modl.images = arr3;
        modl.userImage = [dicc objectForKey:@"userImage"];
        modl.nickname = [dicc objectForKey:@"nickname"];
        modl.rating = [dicc objectForKey:@"rating"];
        modl.content = [dicc objectForKey:@"content"];
        [_datarr addObject:modl];
    }
    [self reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datarr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        TopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"TopCell" owner:self options:nil]lastObject];
//            cell.imageview.image = [UIImage imageNamed:@"pig"];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.modata = _datarr[indexPath.row];
        }
        return cell;
    }else if(indexPath.row == 1){
        TTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ccell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"TTopCell" owner:self options:nil]lastObject];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.modata = _datarr[indexPath.row-1];
        }
        return cell;
    }else{
            TTTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cccell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"TTTopCell" owner:self options:nil]lastObject];
                cell.backgroundColor = [UIColor clearColor];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.modata = _datarr[indexPath.row-2];
            }
        return cell;
        }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 160;
    }else if(indexPath.row == 1){
    return 115;
    }else if([self.index isEqual:indexPath]){
        modle *mode = _datarr[indexPath.row-2];
        NSString *text = mode.content;
        CGRect fram = [text boundingRectWithSize:CGSizeMake(250, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        if (fram.size.height <= tableView.rowHeight/3) {
            return 70;
        }else
        {
            return fram.size.height+55;
        }
    }else
        return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![self.index isEqual:indexPath]) {
        self.index = indexPath;
        [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
