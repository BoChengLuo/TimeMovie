//
//  PhotoViewController.m
//  项目一
//
//  Created by wxhl on 16/8/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "PhotoViewController.h"
#import "Collectionview.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ishidden = NO;
    UIBarButtonItem *baritem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    self.navigationItem.leftBarButtonItem = baritem;
    Collectionview *clv = [[Collectionview alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    [self.view addSubview:clv];
    clv.imagarr = self.imaarr;
    [clv scrollToItemAtIndexPath:_index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(zer:) name:@"toch1" object:nil];
    // Do any additional setup after loading the view.
}
-(void)zer:(NSNotificationCenter *)centr{
    _ishidden = !_ishidden;
    [self.navigationController setNavigationBarHidden:_ishidden animated:YES];
}
-(BOOL)prefersStatusBarHidden{
    _ishidden = !_ishidden;
    return _ishidden;
}
-(void)itemAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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
