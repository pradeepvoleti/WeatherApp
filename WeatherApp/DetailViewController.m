//
//  DetailViewController.m
//  WeatherApp
//
//  Created by Pradeep Voleti on 17/08/16.
//  Copyright © 2016 Pradeep Voleti. All rights reserved.
//

#import "DetailViewController.h"
#import "NSString+Extended.h"
#import "Weather.h"

@interface DetailViewController () 

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSMutableAttributedString *string;
@end

@implementation DetailViewController

#pragma mark - Setters

- (void)setWeather:(Weather *)weather {
    
    if (!_weather || _weather != weather) {
        _weather = weather;
        [self setTextViewContent:weather];
    }
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTextViewContent:self.weather];
}

#pragma mark - DetailsVC Delegate

- (void)didSelectWeather:(Weather *)weather {
    
    [self setTextViewContent:weather];
}

#pragma mark - Private

- (void)setTextViewContent:(Weather *)weather {
    
    self.string = [[NSMutableAttributedString alloc]init];
    
    [self addAttributedStringForKey:@"Weather Id" value:weather.weatherId];
    [self addAttributedStringForKey:@"Weather Main" value:weather.weatherMain];
    [self addAttributedStringForKey:@"Weather Description" value:weather.weatherDescription];
    [self addAttributedStringForKey:@"DT" value:weather.dt];
    [self addAttributedStringForKey:@"Day Temperature" value:weather.dayTemp];
    [self addAttributedStringForKey:@"Minimum  Temperature" value:weather.minTemp];
    [self addAttributedStringForKey:@"Maximum  Temperature" value:weather.maxTemp];
    [self addAttributedStringForKey:@"Night  Temperature" value:weather.nightTemp];
    [self addAttributedStringForKey:@"Evening  Temperature" value:weather.eveTemp];
    [self addAttributedStringForKey:@"Morning  Temperature" value:weather.mornTemp];
    [self addAttributedStringForKey:@"Pressure" value:weather.pressure];
    [self addAttributedStringForKey:@"Humidity" value:weather.humidity];
    [self addAttributedStringForKey:@"Speed" value:weather.speed];
    [self addAttributedStringForKey:@"Degree" value:weather.deg];
    [self addAttributedStringForKey:@"Clouds" value:weather.clouds];
    
    self.textView.attributedText = self.string;
}

- (void)addAttributedStringForKey:(NSString *)key value:(NSString *)value {
    
    if (!value) {
        return;
    }
    
    [self.string appendAttributedString:[key titleAttributedString]];
    [self.string appendAttributedString:[NSString spaceAttributedString]];
    [self.string appendAttributedString:[value valueAttributedString]];
    [self.string appendAttributedString:[NSString newLineAttributedString]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
