//
//  Tableview.h
//  项目一
//
//  Created by wxhl on 16/9/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tableview : UITableView<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_datarr;
}
@property(nonatomic,strong)NSIndexPath *index;
@end
