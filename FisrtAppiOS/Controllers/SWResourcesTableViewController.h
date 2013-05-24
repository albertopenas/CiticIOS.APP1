//
//  SWResourcesTableViewController.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWResourcesTableViewController : UITableViewController {
    NSArray *resources;
}

- (void)updateView:(NSArray *)results;
- (void)updateViewWithErrors;

- (IBAction)showForm:(id)sender;

@end
