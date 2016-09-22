//
//  TableViewCell.h
//  项目一
//
//  Created by wxhl on 16/8/26.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Datasours;
#import "StarView.h"

@interface TableViewCell : UITableViewCell
{
    __weak IBOutlet UIImageView *imgeaview;
    __weak IBOutlet UILabel *titlelable;
    
    __weak IBOutlet UILabel *slable;
    __weak IBOutlet UILabel *yearlable;
//    __weak IBOutlet StarView *star;
}
@property(nonatomic,strong)Datasours *data1;
@property(nonatomic,strong)StarView *star;
@end
