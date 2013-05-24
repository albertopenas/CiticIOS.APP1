//
//  SWResourceDeteailViewController.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import "SWResourceDeteailViewController.h"

@interface SWResourceDeteailViewController ()

@end

@implementation SWResourceDeteailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [super viewDidLoad];
    [_webview loadRequest:[NSURLRequest requestWithURL:_resource.url]];
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [HUD setLabelText:@"Cargando..."];
    
    [self setTitle:_resource.name];
    [self.navigationItem.backBarButtonItem setTitle:@"Volver"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
#ifndef NDEBUG
    NSLog(@"[%@] %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd),
          [[webView.request URL] absoluteString]);
#endif
    if ([HUD isHidden]) {
        [HUD show:YES];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

@end
