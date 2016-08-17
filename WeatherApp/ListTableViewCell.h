//
//  ListTableViewCell.h
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface ListTableViewCell : UITableViewCell

- (void)setdata:(Weather *)weather;

@end
