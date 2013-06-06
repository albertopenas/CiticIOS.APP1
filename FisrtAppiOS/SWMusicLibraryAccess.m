//
//  SWMusicLibraryAccess.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 04/06/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import "SWMusicLibraryAccess.h"

@implementation SWMusicLibraryAccess

- (void)retriveSongsWithBlock:(void (^)(NSDictionary *result))block {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    dispatch_queue_t callerQueue = dispatch_get_current_queue();
	dispatch_queue_t downloadQueue = dispatch_queue_create("musicQuery_queue", NULL);
    
	dispatch_async(downloadQueue, ^{
		NSDictionary *songResults = [self retriveSongsFromLibrary];
		dispatch_async(callerQueue, ^{
            block(songResults);
		});
	});
}

- (NSDictionary *)retriveSongsFromLibrary {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    int songCount = 0;
    NSMutableArray *artists = [NSMutableArray array];
    NSMutableDictionary *songSortingArray = [NSMutableDictionary dictionary];
    
    MPMediaQuery *query = [MPMediaQuery artistsQuery];
    NSArray *songsByArtist = [query collections];
    
    for (MPMediaItemCollection *album in songsByArtist) {
        
        NSArray *albumSongs = [album items];
        
        for (MPMediaItem *songMediumItem in albumSongs) {
            
            NSString *albumName = [songMediumItem valueForProperty: MPMediaItemPropertyAlbumTitle];
            NSString *artistName = [songMediumItem valueForProperty: MPMediaItemPropertyArtist];
            NSString *songTitle =  [songMediumItem valueForProperty: MPMediaItemPropertyTitle];
            NSNumber *persistentSongItemId = [songMediumItem valueForProperty:MPMediaItemPropertyPersistentID];
            NSDictionary *artistAlbum = [songSortingArray objectForKey:albumName];
            
            if (!artistAlbum) {
                NSMutableArray *songs = [NSMutableArray array];
                artistAlbum = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:artistName,albumName,songs,nil]
                                                          forKeys:[NSArray arrayWithObjects:@"artist",@"album", @"songs",nil]];
                
                [songSortingArray setObject:artistAlbum forKey:albumName];
            }
            
            NSDictionary *song = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:songTitle,persistentSongItemId,nil]
                                                             forKeys:[NSArray arrayWithObjects:@"title",@"songId",nil]];
            [[artistAlbum objectForKey:@"songs"] addObject:song];
            songCount++;
        }
        
        // Introduciomos un bloque comparador para ordenar las canciones
        NSArray *albumKeys = [songSortingArray keysSortedByValueUsingComparator:^(id obj1, id obj2) {
            NSDictionary *one = (NSDictionary*)obj1;
            NSDictionary *two = (NSDictionary*)obj2;
            
            NSString *albumName1 = [one objectForKey:@"album"];
            NSString *albumName2 = [two objectForKey:@"album"];
            return [albumName1 localizedCaseInsensitiveCompare:albumName2];
        }];
        
        for (NSString *albumKey in albumKeys) {
            [artists addObject:[songSortingArray objectForKey:albumKey]];
        }
        
        [songSortingArray removeAllObjects];
    }
    
    return [NSDictionary dictionaryWithObjectsAndKeys: artists, @"artists", [NSNumber numberWithInt:songCount], @"songCount", nil];
    
}

- (MPMediaItem *)getSongForId:(NSNumber *)songId {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    MPMediaPropertyPredicate *mediaItemPersistenceIdPredicate =
    [MPMediaPropertyPredicate predicateWithValue:songId
                                     forProperty:MPMediaItemPropertyPersistentID];
    
    MPMediaQuery *songQuery = [[MPMediaQuery alloc] init];
    [songQuery addFilterPredicate: mediaItemPersistenceIdPredicate];
    
    return [[songQuery items] lastObject];
}

@end
