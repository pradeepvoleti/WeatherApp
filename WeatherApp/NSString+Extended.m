//
//  NSString+Extended.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "NSString+Extended.h"

@implementation NSString (Extended)

- (NSAttributedString *)titleAttributedString {
    NSDictionary *attributedDictionary = @{NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:15.0f]};
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:self attributes:attributedDictionary];
    return attributedString;
}

- (NSAttributedString *)valueAttributedString {
    NSDictionary *attributedDictionary = @{NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Light" size:14.0f]};
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:self attributes:attributedDictionary];
    return attributedString;
}

+ (NSAttributedString *)spaceAttributedString {
    return [[NSAttributedString alloc]initWithString:@"\t:\t"];
}

+ (NSAttributedString *)newLineAttributedString {
    
    return [[NSAttributedString alloc]initWithString:@"\n"];
}

+ (NSAttributedString *)blankAttributedString {
    
    return [[NSAttributedString alloc]initWithString:@""];
}

@end
