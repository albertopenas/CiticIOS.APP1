//
//  SWCellAlumno.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 10/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWCellAlumno : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *cityLbl;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end
