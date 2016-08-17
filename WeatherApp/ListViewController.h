//
//  ListViewController.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Weather;

@protocol ListViewDelegate <NSObject>

- (void)didSelectWeather:(Weather *)weather;

@end

@interface ListViewController : UIViewController

@property (weak, nonatomic) id<ListViewDelegate> delegate;

@property (strong, nonatomic) NSArray *tableData;

@end
