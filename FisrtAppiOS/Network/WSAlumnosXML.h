//
//  WSAlumnosXML.h
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 23/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
#import "Alumno.h"
#import "BaseXmlParser.h"

@interface WSAlumnosXML : BaseXmlParser <NSURLConnectionDelegate> {
    Alumno *tmpAlumno;
    NSMutableData *wipData;
    
    id controller;
    
    NSMutableArray *resultSet;
}

- (void)getAlumnos:(id)aController;

@end
