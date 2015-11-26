//
//  MotionManager.h
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface RTMotionManager : NSObject

/**
 * Start/Stop Methods for the Accelerometer
 */
- (void)startUpdatingAccelerometerWithHandler:(CMAccelerometerHandler)handler;
- (void)stopUpdatingAccelerometer;

/**
 * Start/Stop Methods for the Gyroscope
 */
- (void)startUpdatingGyroscopeWithHandler:(CMGyroHandler)handler;
- (void)stopUpdatingGyroscope;

/**
 * Start/Stop Methods for the MotionActivity Classifier
 */
- (void)startUpdatingMotionActivityWithHandler:(CMMotionActivityHandler)handler;
- (void)stopUpdatingMotionActivity;

@end
