//
//  ListViewController.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"
#import "DataController.h"
#import "MBProgressHUD.h"

NSString *const CellIdentifier = @"cellIdentifier";
CGFloat const CellHeight = 80;
CGFloat const FooterHeight = 0.01;

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
    self.tableView.hidden = YES;
    [self callWeatherAPI];
}

#pragma mark - UITableView Delegates & Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListTableViewCell *cell = (ListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setdata:[self.tableData objectAtIndex:indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.delegate didSelectWeather:[self.tableData objectAtIndex:indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return FooterHeight;
//}

#pragma mark - Private Methods

- (void)callWeatherAPI {
    [self showLoading];
    ListViewController *__weak weakSelf = self;
//    self.dataController = [[DataController alloc]init];
    [self.dataController getListData:^(NSArray *array) {
        weakSelf.tableData = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf hideLoading];
            _tableView.hidden = YES;
            [_tableView reloadData];
        });
    }];
}

#pragma mark - Loaders

-(void)showLoading
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
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
