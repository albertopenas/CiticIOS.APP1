//
//  SWResource.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import "SWResource.h"

@implementation SWResource

// Constructor
- (id)initWithName:(NSString *)aName
       description:(NSString *)aDescription
      andUrlString:(NSString *)aUrlString {
    
    self = [super init];
    
#ifndef NDEBUG
    NSLog(@"[%@] %@ URL:%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), aUrlString);
#endif
    
    if (self) {
        _name = aName;
        _description = aDescription;
        _urlString = aUrlString;
        _url = [[NSURL alloc] initWithString:_urlString];
    }
    
    return self;
}

@end
