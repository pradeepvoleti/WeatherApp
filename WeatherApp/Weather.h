//
//  Weather.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (copy, nonatomic) NSString *dt;
@property (copy, nonatomic) NSString *dayTemp;
@property (copy, nonatomic) NSString *minTemp;
@property (copy, nonatomic) NSString *maxTemp;
@property (copy, nonatomic) NSString *nightTemp;
@property (copy, nonatomic) NSString *eveTemp;
@property (copy, nonatomic) NSString *mornTemp;
@property (copy, nonatomic) NSString *pressure;
@property (copy, nonatomic) NSString *humidity;
@property (copy, nonatomic) NSString *weatherId;
@property (copy, nonatomic) NSString *weatherMain;
@property (copy, nonatomic) NSString *weatherDescription;
@property (copy, nonatomic) NSString *weatherIcon;
@property (copy, nonatomic) NSString *speed;
@property (copy, nonatomic) NSString *deg;
@property (copy, nonatomic) NSString *clouds;

@end
