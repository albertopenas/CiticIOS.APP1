//
//  SWResourceDeteailViewController.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "SWResource.h"
#import <UIKit/UIKit.h>

@interface SWResourceDeteailViewController : UIViewController <UIWebViewDelegate> {
    MBProgressHUD *HUD;
}

@property (weak, nonatomic) IBOutlet UIWebView *webview;

@property (strong, nonatomic) SWResource *resource;

@end
