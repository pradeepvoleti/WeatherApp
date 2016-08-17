//
//  WeatherServiceFetcher.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "WeatherServiceFetcher.h"
#import "Network.h"

NSString *const WeatherAPIURL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=Philadelphia&mode=json&units=metric&cnt=16&APPID=8fe42361dad1acdaa0d63a8181e0f746";

@interface WeatherServiceFetcher ()

@property (strong, nonatomic) NSDictionary *responseDict;

@end

@implementation WeatherServiceFetcher

- (NSDictionary *)fetchWeatherResponseWithSuccess:(SuccessHandler)success failureHandler:(FailureHandler)failure {
    
//    WeatherServiceFetcher *__weak weakSelf = self;
    
    [Network requestForURL:WeatherAPIURL withSuccess:^(NSDictionary *response) {
        
//        if (weakSelf) {
//            weakSelf.responseDict = response;
            success(response);
//        }
        
    } failureHandler:^(NSError *error) {
        NSLog(@"");
        failure(error);
    }];
    
    return self.responseDict;
}

@end
