//
//  ListViewDelegate.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 18/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@protocol ListViewDelegate <NSObject>

- (void)didSelectWeather:(Weather *)weather;

@end
