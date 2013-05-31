//
//  SWReourceFormViewController.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWResourceFormViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)back:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)hideKeyboard:(id)sender;


- (void)postOk;
- (void)postKo;

@end
