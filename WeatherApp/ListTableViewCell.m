//
//  ListTableViewCell.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "ListTableViewCell.h"
#import "Weather.h"

NSString *const ImageURL = @"http://openweathermap.org/img/w/";

@interface ListTableViewCell ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *titles;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (copy, nonatomic) NSString *weatherIcon;
@end

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setdata:(Weather *)weather {
    self.temperature.text = weather.dayTemp;
    self.humidity.text = weather.humidity;
    self.weatherDescription.text = weather.weatherDescription;
    self.weatherIcon = weather.weatherIcon;
    
    [self showImage];
}

- (void)showImage {
    NSString *urlString = [self createURL];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    self.weatherImage.image = img;
}

- (NSString *)createURL {
    NSString *urlString = ImageURL;
    urlString = [urlString stringByAppendingString:self.weatherIcon];
    urlString = [urlString stringByAppendingString:@".png"];
    return urlString;
}

- (void)setTextStyle {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
