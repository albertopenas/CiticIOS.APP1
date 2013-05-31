//
//  SWImageDetailViewController.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 31/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "SWImageDetailViewController.h"

@interface SWImageDetailViewController ()

@end

@implementation SWImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.minimumZoomScale = 1.0f;
    _scrollView.maximumZoomScale = 2.0f;

    [_avatarImageView setImageWithURL:[NSURL URLWithString:_avatarUrlString]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _avatarImageView;
}

@end
