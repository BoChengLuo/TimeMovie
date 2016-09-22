//
//  Moretableview.h
//  项目一
//
//  Created by wxhl on 16/9/11.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Moretableview : UITableView<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    NSArray *_datarry;
    NSString *_string;
}
@end
