//
//  SWImageDetailViewController.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 31/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWImageDetailViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) NSString* avatarUrlString;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
