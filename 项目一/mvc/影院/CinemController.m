//
//  CinemController.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "CinemController.h"
#import "Tableviewcel.h"
#import "Moviemodel.h"

@interface CinemController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CinemController

- (void)viewDidLoad {
    [super viewDidLoad];
    _TatleView.backgroundColor = [UIColor grayColor];
    _TatleView.dataSource = self;
    _TatleView.delegate = self;
    [self creatData];
    // Do any additional setup after loading the view.
}

-(void)creatData{
    _dataarry = [NSMutableArray array];
//    解析json文件
    NSString *str = [[NSBundle mainBundle]pathForResource:@"cinema_list" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:str];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *arr = [dic objectForKey:@"cinemaList"];
    for (NSDictionary *dicc in arr) {
        Moviemodel *modata = [[Moviemodel alloc]init];
        modata.name = [dicc objectForKey:@"name"];
        modata.circleName = [dicc objectForKey:@"circleName"];
        modata.address = [dicc objectForKey:@"address"];
        modata.lowPrice = [dicc objectForKey:@"lowPrice"];
        modata.tel = [dicc objectForKey:@"tel"];
        [_dataarry addObject:modata];
    }
    [_TatleView reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataarry.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Tableviewcel *cell = [tableView dequeueReusableCellWithIdentifier:@"cellone" forIndexPath:indexPath];
    cell.data = _dataarry[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:.8];
    return cell;
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
