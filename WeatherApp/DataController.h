//
//  DataController.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@class Weather;

typedef void (^LoadWeather)(NSArray *array);

@interface DataController : NSObject

- (Weather *)getListData:(LoadWeather)callback;

@end
