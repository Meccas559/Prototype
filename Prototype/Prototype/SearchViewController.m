//
//  SearchViewController.m
//  Prototype
//
//  Created by Mecca Shabazz on 10/4/16.
//  Copyright © 2016 SeanCampBell. All rights reserved.
//

#import "SearchViewController.h"
#import <CoreLocation/CoreLocation.h>
#define METERS_PER_MILE 1609.344


@interface SearchViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@property CLLocationCoordinate2D currentLocal;
@property NSInteger lat;
@property NSInteger longi;
@property CLLocationCoordinate2D zoomLocation;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

// CLLocationManager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:
(NSArray *)locations
{
    
    NSLog(@"location info object= %@", [locations lastObject]);
    CLLocation *crnLoc = [locations lastObject];
    _currentLocal.latitude = crnLoc.coordinate.latitude;
    _currentLocal.longitude = crnLoc.coordinate.longitude;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager error: %@", error.localizedDescription);////
    self.currentLocal = kCLLocationCoordinate2DInvalid;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
        _mapView.showsUserLocation = YES;
        NSLog(@"Location manager is successful");
        
    } else if (status == kCLAuthorizationStatusDenied) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location services not authorized"
                                                        message:@"This app needs you to authorize locations services to work."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        
    } else
        NSLog(@"Wrong location status");
}


- (void)viewWillAppear:(BOOL)animated {
    
    // 1
    
    _zoomLocation.latitude = 40.7914;
    _zoomLocation.longitude= -77.8586;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(_zoomLocation, 0.9*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
    _mapView.zoomEnabled = YES;
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
