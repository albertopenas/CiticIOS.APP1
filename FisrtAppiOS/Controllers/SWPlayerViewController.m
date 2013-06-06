//
//  SWPlayerViewController.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 05/06/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "AudioStreamer.h"
#import "SWMusicPlayer.h"
#import "SWPlayerViewController.h"

@interface SWPlayerViewController ()

@property (nonatomic, strong) SWMusicPlayer *player;
@property (nonatomic, strong) AudioStreamer *streamPlayer;
@end

@implementation SWPlayerViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [super viewDidLoad];
    
    _titleLabel.text = _songTitle;
    _artistLabel.text = _artist;
    _albumLabel.text = _album;
    
    //[SWMusicPlayer initSession];
    //_player = [[SWMusicPlayer alloc] init];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [super viewDidAppear:animated];
    //[_player playSongWithId:_songId];
    
    _streamPlayer = [[AudioStreamer alloc] initWithURL:[NSURL URLWithString:@"http://vpr.streamguys.net/vpr96.mp3"]];
    [_streamPlayer start];
}

- (void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [super viewWillDisappear:animated];
    [_player clear];
    
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)play:(id)sender {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [_player play];
}

- (IBAction)pause:(id)sender {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [_player pause];
}

#pragma mark - Background Mode
- (BOOL)canBecomeFirstResponder {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    return YES;
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [_player remoteControlReceivedWithEvent:event];
}

@end
