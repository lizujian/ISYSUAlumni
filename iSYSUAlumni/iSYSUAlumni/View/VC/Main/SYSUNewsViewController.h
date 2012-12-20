//
//  SYSUNewsViewController.h
//  iSYSUAlumni
//
//  Created by again on 12/19/12.
//  Copyright (c) 2012 again. All rights reserved.
//

#import "SYSUBaseViewController.h"
#import "PullTableView.h"
#import "ISYSUProtocols.h"
@class ISYSUNewsListGetter;
@interface SYSUNewsViewController : SYSUBaseViewController <ISYSUGetterDelegate, UITableViewDataSource,UITableViewDelegate, PullTableViewDelegate>
{
    ISYSUNewsListGetter *_getterPtr;//获取新闻列表的getter
    PullTableView *newsTableView;
    NSInteger newsType;
}

@property (nonatomic, strong) PullTableView *newsTableView;
@property (nonatomic) NSInteger newsType;
@end
