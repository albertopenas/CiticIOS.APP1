//
//  SWResource.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWResource : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *urlString;
@property (nonatomic, retain) NSURL *url;

- (id)initWithName:(NSString *)aName
       description:(NSString *)aDescription
      andUrlString:(NSString *)aUrlString;

@end
