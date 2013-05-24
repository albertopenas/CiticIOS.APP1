//
//  AlumnosTableViewController.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 10/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlumnosTableViewController : UITableViewController

@property (nonatomic, retain) NSArray *alumnos;

- (void)updateView:(NSArray *)result;

@end
