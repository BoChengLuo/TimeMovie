//
//  NewPhotoController.m
//  项目一
//
//  Created by wxhl on 16/8/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewPhotoController.h"
#import "NewsModle.h"
#import "PhotoNavigationController.h"
#import "PhotoViewController.h"

@interface NewPhotoController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation NewPhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatdata];
    
    // Do any additional setup after loading the view.
}
-(void)creatdata{
    NSString *str = [[NSBundle mainBundle]pathForResource:@"image_list" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:str];
    NSArray *arr =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    _Photoarr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        NewsModle *modle = [[NewsModle alloc]init];
        modle.image = dic[@"image"];
        [_Photoarr addObject:modle];
    }
    [collectionview reloadData];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _Photoarr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionview dequeueReusableCellWithReuseIdentifier:@"collect" forIndexPath:indexPath];
    UIImageView *imagev = [cell.contentView viewWithTag:110];
    NewsModle *new = _Photoarr[indexPath.row];
    NSString *str = new.image;
    NSURL *url = [NSURL URLWithString:str];
    [imagev sd_setImageWithURL:url];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *arr = [NSMutableArray array];
    for (NewsModle *modle in _Photoarr) {
        NSString *str = modle.image;
        [arr addObject:str];
    }
    PhotoViewController *view = [[PhotoViewController alloc]init];
    PhotoNavigationController *photo = [[PhotoNavigationController alloc]initWithRootViewController:view];
    view.imaarr = arr;
    view.index = indexPath;
//    [self.navigationController pushViewController:view animated:YES];
    [self presentViewController:photo animated:YES completion:nil];
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
