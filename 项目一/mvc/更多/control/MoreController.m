//
//  MoreController.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "MoreController.h"
#import "Moretableview.h"

@interface MoreController ()

@end

@implementation MoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview = [[Moretableview alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableview];
//    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
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
