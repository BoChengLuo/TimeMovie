//
//  MainTabBarController.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "MainTabBarController.h"
#import "TabBaritem.h"

@interface MainTabBarController ()
{
    UIImageView *_selectView;
}
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all.png"]];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64@2x.png"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self creatTabbar];
}
-(void)creatTabbar{
    for (UIView *view in self.tabBar.subviews) {
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
    NSArray *imagarr = @[@"movie_cinema@2x.png",@"msg_new@2x.png",@"start_top250@2x.png",@"icon_cinema@2x.png",@"more_setting@2x.png"];
    NSArray *textarr = @[@"电影",@"新闻",@"top",@"影院",@"更多"];
    CGFloat buttonwidht = KScreenWidth/5;
    CGFloat buttonhight = CGRectGetHeight(self.tabBar.frame);
    _selectView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, buttonwidht, buttonhight)];
    _selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all@2x.png"];
    [self.tabBar addSubview:_selectView];
    for (int i=0; i<imagarr.count; i++) {
        TabBaritem *item = [[TabBaritem alloc]initWithFrame:CGRectMake(i*buttonwidht, 0, buttonwidht, buttonhight) imagName:imagarr[i] titletext:textarr[i]];
        item.tag = 100+i;
        [self.tabBar addSubview:item];
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
-(void)itemClick:(TabBaritem *)item{
    self.selectedIndex = item.tag-100;
    [UIView animateWithDuration:.2 animations:^{
        _selectView.center = item.center;
    }];
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
