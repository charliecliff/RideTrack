//
//  Trip.h
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocation;
@class CMAccelerometerData;
@class CMGyroData;
@class CMMotionActivity;

@interface RTTripTrack : NSObject

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *stopDate;

@property (nonatomic, strong) CLLocation *originLocation;
@property (nonatomic, strong) CLLocation *destinationLocation;

@property (nonatomic, strong) NSMutableArray *locationData;
@property (nonatomic, strong) NSMutableArray *accelData;
@property (nonatomic, strong) NSMutableArray *gyroData;
@property (nonatomic, strong) NSMutableArray *motionActivityData;

/**
 * TODO: Documentation
 */
- (void)addAccelerationData:(CMAccelerometerData *)data;

/**
 * TODO: Documentation
 */
- (void)addGyroscopeData:(CMGyroData *)data;

/**
 * TODO: Documentation
 */
- (void)addMotionActivity:(CMMotionActivity *)activity;

@end
