//
//  WSPostResource.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
@class SWResource;
#import <Foundation/Foundation.h>

@interface WSPostResource : NSObject {
    id controller;
}

- (void)postResource:(SWResource *)aResource
       forController:(id)aController;

@end
