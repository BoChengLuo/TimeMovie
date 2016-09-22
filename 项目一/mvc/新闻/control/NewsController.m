//
//  NewsController.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewsController.h"
#import "NewsModle.h"
#import "NewsCell.h"
#import "NewPhotoController.h"
#import "NewFileController.h"
//#import "UIView+WebCacheOperation.h"

@interface NewsController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation NewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatdata];
    _tableview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x.png"]];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    [self creatview];
    
    
    // Do any additional setup after loading the view.
}
-(void)creatview{
    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 150)];
    _newlable = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, KScreenWidth, 30)];
    _newlable.textAlignment = NSTextAlignmentCenter;
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 150)];
//    view.backgroundColor = [UIColor greenColor];
    [self.view insertSubview:_imageview aboveSubview:_tableview];
//    [self.view addSubview:view];
    [self.view insertSubview:_newlable aboveSubview:_imageview];
    NewsModle *new = _datarr[0];
    NSString *str = new.image;
    NSURL *rel = [NSURL URLWithString:str];
    [_imageview sd_setImageWithURL:rel];
    _imageview.backgroundColor = [UIColor greenColor];
    _newlable.text = new.title;
    _newlable.textColor = [UIColor whiteColor];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat moveY = scrollView.contentOffset.y;
    if (moveY>=0) {
        CGRect fram = _imageview.frame;
        fram.origin.y = -moveY;
        _imageview.frame = fram;
    }else{
        CGFloat height = 150 + ABS(moveY);
        CGFloat width = KScreenWidth / 150 * height;
        CGRect frame = CGRectMake(-(width - KScreenWidth)/2, 0, width, height);
        _imageview.frame = frame;

    }
    CGRect fram1 = _newlable.frame;
    CGRect fram2 = _imageview.frame;
    fram1.origin.y = CGRectGetMaxY(fram2) - fram1.size.height;
    _newlable.frame = fram1;
}
-(void)creatdata{
    _datarr = [NSMutableArray array];
    NSArray *dataarr = (NSArray *)[SwitchData SwitchData:@"news_list.json"];
    for (NSDictionary *dic in dataarr) {
        NewsModle *modle = [[NewsModle alloc]init];
        modle.newsid = dic[@"newsid"];
        modle.type = dic[@"type"];
        modle.title = dic[@"title"];
        modle.summary = dic[@"summary"];
        modle.image = dic[@"image"];
        [_datarr addObject:modle];
    }
    [_tableview reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datarr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xx" forIndexPath:indexPath];
        UIImageView *view1 = [cell.contentView viewWithTag:101];
        NewsModle *new = _datarr[indexPath.row];
        NSString *str = new.image;
        NSURL *url = [NSURL URLWithString:str];
        [view1 sd_setImageWithURL:url];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identcell" ];
    cell.Data = _datarr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModle *new = _datarr[indexPath.row];
    NSInteger n = [new.type integerValue];
    if (n == 1) {
        NewPhotoController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"photo"];
        [view1 setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view1 animated:YES];
    }else if (n==0){
        NewFileController *view2 = [self.storyboard instantiateViewControllerWithIdentifier:@"file"];
        [view2 setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view2 animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 160;
    }
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
