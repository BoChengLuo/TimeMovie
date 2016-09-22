//
//  TopController.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopController.h"
#import "Datasours.h"
#import "TopViewCell.h"
#import "ToppController.h"

@interface TopController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>;

@end

@implementation TopController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatdata];
    _collectongview.dataSource = self;
    _collectongview.delegate = self;
    // Do any additional setup after loading the view.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _toparr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopViewCell *cell = [_collectongview dequeueReusableCellWithReuseIdentifier:@"xx" forIndexPath:indexPath];
    cell.data = _toparr[indexPath.row];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ToppController *view = [[ToppController alloc]init];
    view.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:view animated:YES];
//    ViewController *view = [[ViewController alloc]init];
//    [self.navigationController pushViewController:view animated:YES];
    
//    [self presentViewController:view animated:YES completion:nil];
}

-(void)creatdata{
    NSString *str = [[NSBundle mainBundle]pathForResource:@"top250" ofType:@"json"];
    NSData *dat = [NSData dataWithContentsOfFile:str];
    NSDictionary *doc = [NSJSONSerialization JSONObjectWithData:dat options:NSJSONReadingMutableContainers error:NULL];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:dat options:NSJSONReadingMutableContainers error:NULL];
    _toparr = [NSMutableArray array];
    NSArray *arr = [doc objectForKey:@"subjects"];
    for (NSDictionary *dicc in arr) {
        Datasours *modle = [[Datasours alloc]init];
        modle.title = [dicc objectForKey:@"title"];
        modle.images = [dicc objectForKey:@"images"];
        modle.average = [[dicc objectForKey:@"rating"]objectForKey:@"average"];
        [_toparr addObject:modle];
    }
    [_collectongview reloadData];
    
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
