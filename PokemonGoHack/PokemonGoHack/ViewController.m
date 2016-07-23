//
//  ViewController.m
//  PokemonGoHack
//
//  Created by Vivian Aranha on 7/23/16.
//  Copyright © 2016 Vivian Aranha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *theManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.theManager = [[CLLocationManager alloc] init];
    self.theManager.delegate = self;
    
    if([self.theManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
        [self.theManager requestWhenInUseAuthorization];
    } else {
        [self.theManager startUpdatingLocation];
    }

}


- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status  {
    if(status == kCLAuthorizationStatusAuthorizedAlways) {
        [self.theManager startUpdatingLocation];
    }
}

@end
