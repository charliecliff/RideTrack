//
//  TripTrackingManager.m
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import "RideTrack.h"
#import "RTLocationManager.h"
#import "RTMotionManager.h"
#import "RTTripTrack.h"

@interface RideTrack () <RTLocationDelegate> {
    BOOL currentlyTrackingTrip;
}

@property (nonatomic, strong) RTLocationManager *locationManager;
@property (nonatomic, strong) RTMotionManager *motionManager;

@property (nonatomic, strong) RTTripTrack *currentTripTrack;
@property (nonatomic, strong) NSMutableArray *tripTracks;

@end

@implementation RideTrack

#pragma mark - Singleton

+ (RideTrack *)tracker {
    static RideTrack *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

#pragma mark - Init

- (RideTrack *)init {
    self = [super init];
    if ( self != nil) {
        self.locationManager = [[RTLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.motionManager = [[RTMotionManager alloc] init];
    }
    return self;
}

#pragma mark - Tracking

- (void)startTracking {
    [self.locationManager startMonitoringVisits];
}

- (void)stopTracking {
    [self.locationManager stopMonitoringVisits];
}

#pragma mark - Trip Tracks

- (void)startMonitoringTripTrack {
    // 1. Create a New Trip Track
    self.currentTripTrack = [[RTTripTrack alloc] init];
    self.currentTripTrack.startDate = [NSDate date];
    self.currentTripTrack.originLocation = self.locationManager.currentLocation;
    
    // 2. Start Monitoring the Motion Data
    __block __typeof(self)blockSelf = self;
    
    //  2-A. Accelerometer
    [self.motionManager startUpdatingAccelerometerWithHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        if (error == nil) {
            [blockSelf.currentTripTrack addAccelerationData:accelerometerData];
        }
    }];
    //  2-B. Gyroscope
    [self.motionManager startUpdatingGyroscopeWithHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        if (error == nil) {
            [blockSelf.currentTripTrack addGyroscopeData:gyroData];
        }
    }];
    //  2-C. Motion Activity Classification
    [self.motionManager startUpdatingMotionActivityWithHandler:^(CMMotionActivity * _Nullable activity) {
        if (activity != nil) {
            [blockSelf.currentTripTrack addMotionActivity:activity];
        }
    }];
}

- (void)stopMonitoringTripTrack {
    self.currentTripTrack.stopDate = [NSDate date];
    self.currentTripTrack.destinationLocation = self.locationManager.currentLocation;
    [self.tripTracks addObject:self.currentTripTrack];
    [self.delegate didCompleteTripTrack:self.currentTripTrack];
    self.currentTripTrack = nil;
}

#pragma mark - RTLocationDelegate

- (void)didArrive:(CLVisit *)visit {
    [self stopMonitoringTripTrack];
}

- (void)didDepart:(CLVisit *)visit {
    [self startMonitoringTripTrack];
}

@end
