//
//  NewFileController.m
//  项目一
//
//  Created by wxhl on 16/8/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewFileController.h"

@interface NewFileController ()<UIWebViewDelegate>

@end

@implementation NewFileController

- (void)viewDidLoad {
    [super viewDidLoad];
    _wbview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-64)];
    [self creatdata];
    _wbview.delegate = self;
    [self.view addSubview:_wbview];
    // Do any additional setup after loading the view.
}
-(void)creatdata{
    NSString *str = [[NSBundle mainBundle]pathForResource:@"news_detail" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:str];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSString *title = [dic objectForKey:@"title"];
    NSString *content = [dic objectForKey:@"content"];
//    NSString *content = [dic objectForKey:@"content"];
    NSString *time = [dic objectForKey:@"time"];
    NSString *source = [dic objectForKey:@"source"];
    NSString *author = [dic objectForKey:@"author"];
    NSString *fil = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *fils = [NSString stringWithContentsOfFile:fil encoding:NSASCIIStringEncoding error:nil];
    NSString *cont = [NSString stringWithFormat:@"%@ %@",source,time];
    NSString *aut = [NSString stringWithFormat:@"来自：%@",author];
    NSString *htfil = [NSString stringWithFormat:fils,title,cont,content,aut];
    [_wbview loadHTMLString:htfil baseURL:nil];
    _actview = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _actview.frame = CGRectMake(0, 0, 50, 50);
    _actview.center = _wbview.center;
    _actview.backgroundColor = [UIColor blackColor];
    [_wbview addSubview:_actview];
//    NSString *editor = [dic objectForKey:@"editor"];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_actview startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_actview stopAnimating];
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
