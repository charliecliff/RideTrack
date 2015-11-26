//
//  LocationManager.h
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol RTLocationDelegate <NSObject>
@required
- (void)didArrive:(CLVisit *)visit;
- (void)didDepart:(CLVisit *)visit;
@end

@interface RTLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, weak) id<RTLocationDelegate>delegate;

@property (nonatomic, strong, readonly) CLLocation *currentLocation;

/**
 * TODO: Document
 */
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

/**
 * TODO: Document
 */
- (void)startMonitoringVisits;
- (void)stopMonitoringVisits;

@end
