//
//  WeatherServiceFetcher.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface WeatherServiceFetcher : NSObject

- (NSString *)fetchWeatherResponseWithSuccess:(SuccessHandler)success failureHandler:(FailureHandler)failure;

@end
