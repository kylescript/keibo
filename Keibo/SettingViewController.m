//
//  SettingViewController.m
//  Keibo
//
//  Created by kyle on 13-10-31.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController () <UIActionSheetDelegate>

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"设置";
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabbar_setting"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *_theButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 195, 300, 40)];
    [_theButton setBackgroundImage:[[UIImage imageNamed:@"ExitButtonBackground"] stretchableImageWithLeftCapWidth:2.5 topCapHeight:15] forState:UIControlStateNormal];
    [_theButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [_theButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:_theButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 2;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *commonIdentifier = @"commonIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:commonIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commonIdentifier];
    }
    NSString *text;
    switch (indexPath.section) {
        case 0:
            text = @"草稿箱";
            break;
        case 1:
            if (indexPath.row == 0) {
                text = @"清除缓存";
            } else {
                text = @"关于小果微博";
            }
            break;
        default:
            break;
    }
    cell.textLabel.text = text;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

#pragma mark -- logout
- (void)logout
{
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"确定退出登录本账号？"
                                                        delegate:self
                                               cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:@"退出登录"
                                               otherButtonTitles:nil];
    
    [action showInView:self.navigationController.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //退出登录
    if (buttonIndex == 0) {
        //TODO logout
    }
}
@end
