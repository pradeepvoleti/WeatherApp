//
//  WebServiceController.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "WebServiceController.h"

@implementation WebServiceController

+(instancetype) serviceControllerWithDelegate:(id <WebServiceControllerDelegate>) delegate {
    
    WebServiceController *serviceController = [[WebServiceController alloc]init];
    [serviceController setDelegate:delegate];
    return serviceController;
}

- (void)requestWithURL:(NSString *)urlString
{
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            
            NSError *jsonError;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            
            if (!jsonError) {
                [self.delegate successWithResponse:responseDictionary];
            
            } else {
                [self.delegate failedWithError:jsonError andResponse:nil];
            }
            
        } else {
            
            [self.delegate failedWithError:error andResponse:response];
        }
    }];
    [task resume];
}

@end
