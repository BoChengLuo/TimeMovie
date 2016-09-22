//
//  ShowNavigationController.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "ShowNavigationController.h"

@interface ShowNavigationController ()

@end

@implementation ShowNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *textfont = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16]};
    self.navigationBar.titleTextAttributes = textfont;
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
