//
//  MotionManager.m
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import "RTMotionManager.h"

#define DEFAULT_GYROSCOPE_UPDATE_PERIOD 0.2
#define DEFAULT_ACCELEROMETER_UPDATE_PERIOD 0.2

@interface RTMotionManager ()

@property (nonatomic, strong) CMMotionManager *motionManager;
@property (nonatomic, strong) CMMotionActivityManager *activityManager;

@end

@implementation RTMotionManager

#pragma mark - Init

- (RTMotionManager *)init {
    self = [super init];
    if ( self != nil) {
        [self setUpMotionManager];
        [self setUpActivityManager];
    }
    return self;
}

#pragma mark - Set Up

- (void)setUpMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = DEFAULT_GYROSCOPE_UPDATE_PERIOD;
    self.motionManager.gyroUpdateInterval = DEFAULT_ACCELEROMETER_UPDATE_PERIOD;
}

- (void)setUpActivityManager {
    if ([CMMotionActivityManager isActivityAvailable])
        self.activityManager = [[CMMotionActivityManager alloc] init];
}

#pragma mark - Accelerometer

- (void)startUpdatingAccelerometerWithHandler:(CMAccelerometerHandler)handler {
    if (self.motionManager == nil) [self setUpMotionManager];
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:handler];
}

- (void)stopUpdatingAccelerometer {
    if (self.motionManager != nil) {
        [self.motionManager stopAccelerometerUpdates];
    }
}

#pragma mark - Gyroscope

- (void)startUpdatingGyroscopeWithHandler:(CMGyroHandler)handler {
    if (self.motionManager == nil) [self setUpMotionManager];
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:handler];
}

- (void)stopUpdatingGyroscope {
    if (self.motionManager != nil) {
        [self.motionManager stopGyroUpdates];
    }
}

#pragma mark - Motion Activity

- (void)startUpdatingMotionActivityWithHandler:(CMMotionActivityHandler)handler {
    if (self.activityManager != nil) {
        [self.activityManager startActivityUpdatesToQueue:[NSOperationQueue currentQueue]
                                              withHandler:handler];
    }
}

- (void)stopUpdatingMotionActivity {
    if (self.activityManager != nil) {
        [self.activityManager stopActivityUpdates];
    }
}

@end
