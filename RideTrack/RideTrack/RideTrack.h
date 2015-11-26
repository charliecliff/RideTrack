//
//  TripTrackingManager.h
//  RideTrack
//
//  Created by Charles Cliff on 11/26/15.
//  Copyright © 2015 Charles Cliff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RideTrack : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *tripTracks;

+ (RideTrack *)tracker;

/**
 * TODO: Document
 */
- (void)startTracking;
- (void)stopTracking;

@end
