//
//  WSJsonResouces.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 24/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
// URL : http://10.19.17.63:3000/resources.json
//
#import "SWResource.h"
#import "JSONKit.h"
#import "AFNetworking.h"
#import "WSJsonResouces.h"

@implementation WSJsonResouces

- (void)getAllResourcesWithController:(id)aController {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    controller = aController;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.19.17.63:3000/resources.json"]];
    
    AFJSONRequestOperation *connection = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                             
} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
    
}];
    [connection start];
}

@end
