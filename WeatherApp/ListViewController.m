//
//  ListViewController.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "ListTableViewCell.h"
#import "DataController.h"
#import "MBProgressHUD.h"

NSString *const CellIdentifier = @"cellIdentifier";
CGFloat const CellHeight = 80;

@interface ListViewController ()

@property (strong, nonatomic) DataController *dataController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

#pragma mark - Setters

- (DataController *)dataController {
    if (!_dataController) {
        _dataController = [[DataController alloc]init];
    }
    return _dataController;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callWeatherAPI];
}

#pragma mark - UITableView Delegates & Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListTableViewCell *cell = (ListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setdata:[self.tableData objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Weather *weather = [self.tableData objectAtIndex:indexPath.row];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [self.delegate didSelectWeather:weather];
    } else {
        
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        
        DetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailViewController class])];
        vc.weather = weather;
        [self.navigationController pushViewController:vc animated:NO];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

#pragma mark - Private

- (void)callWeatherAPI {
    [self showLoading];
    ListViewController *__weak weakSelf = self;
    
    [self.dataController getListData:^(NSArray *array) {
        weakSelf.tableData = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf hideLoading];
            [_tableView reloadData];
            
            [self.delegate didSelectWeather:[self.tableData objectAtIndex:0]];
        });
    }];
    
}

#pragma mark - Loaders

-(void)showLoading
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"Loading...";
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
}

-(void)hideLoading
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
