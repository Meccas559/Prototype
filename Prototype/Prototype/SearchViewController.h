//
//  SearchViewController.h
//  Prototype
//
//  Created by Mecca Shabazz on 10/4/16.
//  Copyright © 2016 SeanCampBell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SearchViewController : UIViewController <MKMapViewDelegate, UISearchBarDelegate >

@property (weak, nonatomic) IBOutlet MKMapView *mapView;



@end
