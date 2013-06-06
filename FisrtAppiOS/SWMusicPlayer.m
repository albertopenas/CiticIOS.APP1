//
//  SWMusicPlayer.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 05/06/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "SWMusicLibraryAccess.h"
#import "SWMusicPlayer.h"

@implementation SWMusicPlayer

+ (void)initSession {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [[AVAudioSession sharedInstance] setDelegate:self];
    
    NSError *setCategoryError = nil;
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback
                                           error:&setCategoryError];
    
    if (setCategoryError) {
        NSLog(@"Ha ocurrido un error");
    }
    
    UInt32 doSetProperty = 0;
    AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryMixWithOthers,
                            sizeof(doSetProperty),
                            &doSetProperty);
    
    NSError *activationError = nil;
    
    [[AVAudioSession sharedInstance] setActive:YES
                                         error:&activationError];
    
    if (activationError) {
        NSLog(@"No se pudo activar el player");
    }
}

- (AVQueuePlayer *)avQueuePlayer {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    if (!_player) {
        _player = [[AVQueuePlayer alloc] init];
    }
    
    return _player;
}

- (void)playSongWithId:(NSNumber *)songId {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    MPMediaItem *mediaItem = [[[SWMusicLibraryAccess alloc] init] getSongForId:songId];
    
    if (mediaItem) {
        NSURL *url = [mediaItem valueForProperty:MPMediaItemPropertyAssetURL];
        AVPlayerItem *song = [[AVPlayerItem alloc] initWithURL:url];
        if (song) {
            [[self avQueuePlayer] insertItem:song afterItem:nil];
            [self play];
        }
    }
}

- (void)pause {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [_player pause];
}

- (void)play {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [_player play];
}
- (void)clear {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [_player removeAllItems];
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)receivedEvent {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        switch (receivedEvent.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause: {
                
                if (_player.rate > 0.0f) {
                    [_player pause];
                } else {
                    [_player play];
                }
                
                break;
            }
            default:
                break;
        }
    }
}

@end
