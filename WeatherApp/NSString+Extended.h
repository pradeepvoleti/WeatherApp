//
//  NSString+Extended.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extended)

- (NSAttributedString *)titleAttributedString;
- (NSAttributedString *)valueAttributedString;
+ (NSAttributedString *)spaceAttributedString;
+ (NSAttributedString *)newLineAttributedString;
+ (NSAttributedString *)blankAttributedString;

@end
