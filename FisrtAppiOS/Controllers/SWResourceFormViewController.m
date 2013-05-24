//
//  SWReourceFormViewController.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "SWResource.h"
#import "WSPostResource.h"
#import "SWResourceFormViewController.h"

@interface SWResourceFormViewController ()

@end

@implementation SWResourceFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    SWResource *res = [[SWResource alloc] init];
    res.name = _nameTextField.text;
    res.description = _descriptionTextField.text;
    res.urlString = _urlTextField.text;
    
    WSPostResource *ws = [[WSPostResource alloc] init];
    [ws postResource:res forController:self];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    if (textField == _nameTextField) {
        [_descriptionTextField becomeFirstResponder];
    } else if (textField == _descriptionTextField) {
        [_urlTextField becomeFirstResponder];
    } else if (textField == _urlTextField) {
        [textField resignFirstResponder];
        [self save:textField];
    }
    
    return YES;
}

#pragma mark - Protocolo Informal
- (void)postOk {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [_nameTextField resignFirstResponder];
    [self back:nil];
}

- (void)postKo {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error"
                          message:@"No se pudo crear"
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [alert show];
}


@end
