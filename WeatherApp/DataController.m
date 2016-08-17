//
//  DataController.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "DataController.h"
#import "WeatherServiceFetcher.h"
#import "Weather.h"

@interface DataController ()
@property (strong, nonatomic) NSDictionary *responseDict;

@end

@implementation DataController

- (Weather *)getListData:(LoadWeather)callback {
    
    DataController *__weak weakSelf = self;
    
    WeatherServiceFetcher *fetcher = [[WeatherServiceFetcher alloc]init];
    
    [fetcher fetchWeatherResponseWithSuccess:^(NSDictionary *response) {
        
        if (weakSelf) {
            weakSelf.responseDict = response;
            NSArray *w = [weakSelf generateModel];
            callback(w);
        }
        
    } failureHandler:^(NSError *error) {
        //Not handling failure case
    }];
    
    return nil;
}

- (NSArray *)generateModel {
    
    NSArray *list = [self.responseDict objectForKey:@"list"];
    
    NSMutableArray *weatherArray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dict in list) {
        
        Weather *weather = [[Weather alloc]init];
        
        weather.dt = [self stringFromNumber:[dict objectForKey:@"dt"]];
        weather.pressure = [self stringFromNumber:[dict objectForKey:@"pressure"]];
        weather.humidity = [self stringFromNumber:[dict objectForKey:@"humidity"]];
        weather.speed = [self stringFromNumber:[dict objectForKey:@"speed"]];
        weather.deg = [self stringFromNumber:[dict objectForKey:@"deg"]];
        weather.clouds = [self stringFromNumber:[dict objectForKey:@"clouds"]];
        
        NSDictionary *temp = [dict objectForKey:@"temp"];
        weather.dayTemp = [self stringFromNumber:[temp objectForKey:@"day"]];
        weather.minTemp = [self stringFromNumber:[temp objectForKey:@"min"]];
        weather.maxTemp = [self stringFromNumber:[temp objectForKey:@"max"]];
        weather.nightTemp = [self stringFromNumber:[temp objectForKey:@"night"]];
        weather.eveTemp = [self stringFromNumber:[temp objectForKey:@"eve"]];
        weather.mornTemp = [self stringFromNumber:[temp objectForKey:@"morn"]];
        
        NSDictionary *weather1 = [[dict objectForKey:@"weather"]firstObject];
        weather.weatherId = [self stringFromNumber:[weather1 objectForKey:@"id"]];
        weather.weatherMain = [weather1 objectForKey:@"main"];
        weather.weatherDescription = [weather1 objectForKey:@"description"];
        weather.weatherIcon = [weather1 objectForKey:@"icon"];
        
        [weatherArray addObject:weather];
    }
    
    return [weatherArray copy];
}

- (NSString *)stringFromNumber:(NSNumber *)number {
    NSString *st = [NSString stringWithFormat:@"%@",number];
    return st;
}

@end
