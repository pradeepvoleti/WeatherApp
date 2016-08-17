//
//  DetailViewController.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewDelegate.h"

@class Weather;

@interface DetailViewController : UIViewController <ListViewDelegate>

@property (strong, nonatomic)Weather *weather;

@end
