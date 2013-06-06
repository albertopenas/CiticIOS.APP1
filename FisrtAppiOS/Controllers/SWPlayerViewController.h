//
//  SWPlayerViewController.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 05/06/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWPlayerViewController : UIViewController

@property (nonatomic, strong) NSString *songTitle;
@property (nonatomic, strong) NSString *album;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSNumber *songId;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;

- (IBAction)play:(id)sender;
- (IBAction)pause:(id)sender;


@end
