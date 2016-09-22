//
//  MovieController.m
//  项目一
//
//  Created by wxhl on 16/8/25.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "MovieController.h"
#import "TableViewCell.h"
#import "Datasours.h"
#import "Pikchview.h"

@interface MovieController ()

@end

@implementation MovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatChanview];
    [self obtaimDta];
    [self creatBarItem];
    // Do any additional setup after loading the view.
}
-(void)creatChanview{
    _proview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
//    _proview.backgroundColor = [UIColor redColor];
    _proview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x.png"]];
    
    _proview.hidden = YES;
    [self.view addSubview:_proview];
    _proview.dataSource = self;
    _proview.delegate = self;
    _proview.rowHeight = 120;
    _proview.separatorColor = [UIColor clearColor];
    _lroview = [[Pikchview alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    _lroview.backgroundColor = [UIColor grayColor];
//    _lroview.hidden = YES;
    [self.view addSubview:_lroview];
    
}
-(void)creatBarItem{
    UIView *buttonview = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 50,35)];
    UIButton *pushbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushbutton.frame = buttonview.frame;
    [pushbutton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    [pushbutton setImage:[UIImage imageNamed:@"list_home@2x.png"] forState:UIControlStateNormal];
    [pushbutton addTarget:self action:@selector(ppbutton:) forControlEvents:UIControlEventTouchUpInside];
    pushbutton.tag = 101;
    [buttonview addSubview:pushbutton];
    UIButton *popbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    popbutton.frame = buttonview.frame;
    [popbutton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    [popbutton setImage:[UIImage imageNamed:@"poster_home@2x.png"] forState:UIControlStateNormal];
    popbutton.hidden = YES;
    [popbutton addTarget:self action:@selector(ppbutton:) forControlEvents:UIControlEventTouchUpInside];
    popbutton.tag = 102;
    [buttonview addSubview:popbutton];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:buttonview];
    self.navigationItem.rightBarButtonItem = item;
    
}
-(void)ppbutton:(UIButton *)but{
    UIView *view = self.navigationItem.rightBarButtonItem.customView;
    UIButton *pbuton = [view viewWithTag:101];
    UIButton *obutton = [view viewWithTag:102];
    pbuton.hidden = !pbuton.hidden;
    obutton.hidden = !obutton.hidden;
    _proview.hidden = !_proview.hidden;
    _lroview.hidden = !_lroview.hidden;
    [self views:view hidden:obutton.hidden];
    [self views:self.view hidden:_lroview.hidden];
}
-(void)views:(UIView *)veiw hidden:(BOOL)hidden{
    UIViewAnimationOptions option = hidden?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:veiw duration:.2 options:option animations:^{
        [veiw exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)obtaimDta{
    NSString *fil = [[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:fil];
    NSDictionary *datadic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    _datarr = [[NSMutableArray alloc]init];
    NSArray *arr = [datadic objectForKey:@"subjects"];
    for (NSDictionary *dic1 in arr) {
        NSDictionary *dic=[dic1 objectForKey:@"subject"];
        
        Datasours *modle = [[Datasours alloc]init];
        modle.title = [dic objectForKey:@"title"];
        modle.subtype = dic[@"subtype"];
        modle.originaltitle = dic[@"original_title"];
        modle.movieid = dic[@"id"];
        modle.collctcout = [dic objectForKey:@"collect_count"];
        modle.images = [dic objectForKey:@"images"];
        modle.average = [[dic objectForKey:@"rating"]objectForKey:@"average"];
        modle.year = dic[@"year"];
        [_datarr addObject:modle];
    }
//    NSLog(@"%@",_datarr);
    [_lroview setAtarr:_datarr];
    [_proview reloadData];
}
#pragma mark---uitableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datarr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"movieCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
    }
    cell.data1 = _datarr[indexPath.row];
    
    return cell;
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
