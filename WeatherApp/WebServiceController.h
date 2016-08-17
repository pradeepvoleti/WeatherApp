//
//  WebServiceController.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebServiceControllerDelegate <NSObject>

- (void)successWithResponse:(id)response;

- (void)failedWithError:(NSError *)error andResponse:(id)response;

@end

@interface WebServiceController : NSObject

@property (nonatomic, assign) id  <WebServiceControllerDelegate> delegate;

+(instancetype) serviceControllerWithDelegate:(id <WebServiceControllerDelegate>) delegate;

- (void)requestWithURL:(NSString *)urlString;

@end

