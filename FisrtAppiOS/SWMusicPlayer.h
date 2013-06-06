//
//  SWMusicPlayer.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 05/06/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>
#import <Foundation/Foundation.h>

@interface SWMusicPlayer : NSObject

@property (nonatomic, strong) AVQueuePlayer *player;

+ (void)initSession;

- (void)playSongWithId:(NSNumber *)songId;
- (void)pause;
- (void)play;
- (void)clear;

- (void)remoteControlReceivedWithEvent:(UIEvent *)receivedEvent;

@end
