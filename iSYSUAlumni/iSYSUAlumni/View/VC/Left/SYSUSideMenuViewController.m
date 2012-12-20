//
//  SYSUSideMenuViewController.m
//  iSYSUAlumni
//
//  Created by again on 12/19/12.
//  Copyright (c) 2012 again. All rights reserved.
//

#import "SYSUSideMenuViewController.h"
#import "IIViewDeckController.h"
#import "SYSUNewsViewController.h"
#import "SYSUSNSViewController.h"
@interface SYSUSideMenuViewController ()
@property (nonatomic, strong) NSArray *sideMenuArr;
@end

@implementation SYSUSideMenuViewController
//@synthesize sideMenu;
@synthesize sideMenuArr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        sideMenuArr = @[@"新闻",@"活动",@"社交",@"相册",@"应用"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"中山大学";
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sideMenuArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [sideMenuArr objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SYSUBaseViewController *baseVC = nil;
    switch (indexPath.row) {
        case 0:
        {
            if ([self.viewDeckController.centerController isKindOfClass:[SYSUNewsViewController class]]) {
                ;
            }
            else {
                baseVC = [[SYSUNewsViewController alloc]init];
            }
        }
            break;
        case 2:
        {
            if ([self.viewDeckController.centerController isKindOfClass:[SYSUSNSViewController class]]) {
                ;
            }
            else {
                baseVC = [[SYSUSNSViewController alloc]init];
            }
        }
        default:
            break;
    }
    if (nil != baseVC) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:baseVC];
        self.viewDeckController.centerController = nav;
    }
    [self.viewDeckController closeLeftViewAnimated:YES];
}


@end
