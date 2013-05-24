//
//  WSJsonResouces.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSJsonResouces : NSObject {
    id controller;
}

- (void)getAllResourcesWithController:(id)aController;

@end
