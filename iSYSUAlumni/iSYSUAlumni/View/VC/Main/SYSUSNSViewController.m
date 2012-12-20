//
//  SYSUSNSViewController.m
//  iSYSUAlumni
//
//  Created by again on 12/19/12.
//  Copyright (c) 2012 again. All rights reserved.
//

#import "SYSUSNSViewController.h"

@interface SYSUSNSViewController ()
-(void)login;
@end

@implementation SYSUSNSViewController

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
    self.title = @"社交";
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login-weibo-bg.png"]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 117, 44)];
    loginButton.center = self.view.center;
    [loginButton setBackgroundImage:[UIImage imageNamed:@"login-weibo-normal.png"] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"login-weibo-highlight.png"] forState:UIControlStateHighlighted];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

-(void)loadView
{
    [super loadView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma action

-(void)login
{
    ;
}

@end
