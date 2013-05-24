//
//  SQLiteAccess+Clases.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 23/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "Clase.h"
#import "SQLiteAccess+Clases.h"

@implementation SQLiteAccess (Clases)

+ (NSArray *)getAllSessions {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
    NSString *query = @"SELECT * FROM clases";
    NSArray *tmp = [SQLiteAccess selectManyRowsWithSQL:query];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    Clase *c = nil;
    
    for (NSDictionary *row in tmp) {
        c = [[Clase alloc] init];
        
        [c setName:[row objectForKey:@"nombre"]];
        [c setDescription:[row objectForKey:@"descripcion"]];
        [c setTeacher:[row objectForKey:@"profesor"]];
        [c setStarts:[row objectForKey:@"inicio"]];
        [c setEnds:[row objectForKey:@"fin"]];
        
        [result addObject:c];
    }
    
    return result;
}

@end
