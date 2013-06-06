//
//  SWMusicLibraryAccess.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 04/06/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import <MediaPlayer/MediaPlayer.h>
#import <Foundation/Foundation.h>

@interface SWMusicLibraryAccess : NSObject

- (void)retriveSongsWithBlock:(void (^)(NSDictionary *result))block;
- (MPMediaItem *)getSongForId:(NSNumber *)songId;

@end
