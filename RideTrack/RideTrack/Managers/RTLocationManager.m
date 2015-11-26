//
//  LocationManager.m
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import "RTLocationManager.h"

@interface RTLocationManager ()

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation RTLocationManager

#pragma mark - Init

- (RTLocationManager *)init {
    self = [super init];
    if ( self != nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.delegate = self;
        
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined && [self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [_locationManager requestAlwaysAuthorization];
        }
    }
    return self;
}

#pragma mark - CLLocation

- (void)startUpdatingLocation {
    [self.locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation {
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - CLVisit

- (void)startMonitoringVisits {
    if ([self.locationManager respondsToSelector:@selector(startMonitoringVisits)]) {
        [self.locationManager startMonitoringVisits];
    }
}

- (void)stopMonitoringVisits {
    if ([self.locationManager respondsToSelector:@selector(stopMonitoringVisits)]) {
        [self.locationManager stopMonitoringVisits];
    }
}

#pragma mark - CLLocationManager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
}

- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit {
    // Departure
    if (visit.departureDate != nil) {
        
    }
    // Arrival
    else {
        
    }
    
}

@end
