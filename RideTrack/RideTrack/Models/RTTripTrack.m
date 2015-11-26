//
//  Trip.m
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import "RTTripTrack.h"

@implementation RTTripTrack

#pragma mark - Adding Data

- (void)addAccelerationData:(CMAccelerometerData *)data {
    [self.accelData addObject:data];
}

- (void)addGyroscopeData:(CMGyroData *)data {
    [self.gyroData addObject:data];
}

- (void)addMotionActivity:(CMMotionActivity *)activity {
    [self.motionActivityData addObject:activity];
}

@end
