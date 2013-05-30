//
//  SWAlumnoDetailViewController.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 30/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "Alumno.h"
#import "UIImageView+AFNetworking.h"
#import "SWAlumnoDetailViewController.h"
#import "CiticAnnotation.h"
@interface SWAlumnoDetailViewController ()

@end

@implementation SWAlumnoDetailViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [super viewDidLoad];
    
    _nameLabel.text = _alumno.name;
    _emailLabel.text = _alumno.email;
    [_avatarImageView setImageWithURL:_alumno.avatarUrl];

    CiticAnnotation *annot = [[CiticAnnotation alloc] init];
    [_mapView addAnnotation:annot];
}

- (void)didReceiveMemoryWarning {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [super didReceiveMemoryWarning];
}

@end
