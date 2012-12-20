//
//  SYSUNewsViewController.m
//  iSYSUAlumni
//
//  Created by again on 12/19/12.
//  Copyright (c) 2012 again. All rights reserved.
//

#import "SYSUNewsViewController.h"
//#import "MFSideMenu.h"
#import "ISYSUNewsListGetter.h"

@interface SYSUNewsViewController ()

@end

@implementation SYSUNewsViewController
@synthesize newsTableView;
@synthesize newsType;


//更新Info
- (void) updateInfo{
	NSLog(@"updateInfo");
	if(_getterPtr!=nil)
		return;
    
    _getterPtr = [ISYSUNewsListGetter getterWithDelegate:self withType:newsType];
}

-(id)init{
    self = [super init];
    if (self) {
        newsType=1;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"新闻";
    newsTableView = [[PullTableView alloc]initWithFrame:CGRectMake(0, 0, 320, APP_HEIGHT-NavBarHeight - 44 +5) style:UITableViewStylePlain includeRefreshView:YES includeLoadMoreView:NO];
    newsTableView.delegate = self;
    newsTableView.dataSource = self;
    newsTableView.pullDelegate = self;
    newsTableView.pullTableIsRefreshing = NO;
    [newsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    newsTableView.backgroundColor = RGBCOLOR(230, 230, 230);
    [self.view addSubview:newsTableView];
}

-(void)loadView
{
    [super loadView];
//    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

#pragma mark pulltableview delegate

- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView{
//    [self loadSongs:NO];
}

@end
