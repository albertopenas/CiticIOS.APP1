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

@interface SWResourceFormViewController () {
    UITextField *selectedTextField;
}

@end

@implementation SWResourceFormViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardUp)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardHidden)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideKeyboard:)
                                                 name:@"hide"
                                               object:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"hide"
                                                  object:nil];
}

#pragma mark - Keyboard Methods
- (void)keyboardUp {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
   
    [_scrollView setFrame:CGRectMake(_scrollView.frame.origin.x,
                                     _scrollView.frame.origin.y,
                                     _scrollView.frame.size.width,
                                     _scrollView.frame.size.height - 216.0f)];
    
    [_scrollView setContentSize:CGSizeMake(320, 290)];
    
    [_scrollView scrollRectToVisible:CGRectMake(selectedTextField.frame.origin.x,
                                                selectedTextField.frame.origin.y,
                                                selectedTextField.frame.size.width,
                                                selectedTextField.frame.size.height+30.f)
                                                animated:YES];
}

- (void)keyboardHidden {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    [_scrollView setFrame:CGRectMake(_scrollView.frame.origin.x,
                                     _scrollView.frame.origin.y,
                                     _scrollView.frame.size.width,
                                     _scrollView.frame.size.height + 216.0f)];
    
    [_scrollView setContentSize:CGSizeMake(320, _scrollView.frame.size.height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

- (IBAction)hideKeyboard:(id)sender {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    [_urlTextField resignFirstResponder];
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
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hide" object:nil];
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    selectedTextField = textField;
    
    [_scrollView scrollRectToVisible:CGRectMake(selectedTextField.frame.origin.x,
                                                selectedTextField.frame.origin.y,
                                                selectedTextField.frame.size.width,
                                                selectedTextField.frame.size.height+30.f)
                            animated:YES];
    
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
