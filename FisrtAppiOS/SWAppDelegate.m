//
//  SWAppDelegate.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 10/05/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//
// IP: http://10.19.19.123:3000/

#import "Alumno.h"
#import "SWAppDelegate.h"

@implementation SWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    Alumno *al1 = [[Alumno alloc] init];
    [al1 setName:@"Pablo"];
    [al1 setLastname:@"Formosp"];
    [al1 setCity:@"Coruña"];
    [al1 setEmail:@"pablo@pabloformoso.com"];
    
    Alumno *al2 = [[Alumno alloc] init];
    [al2 setName:@"Pablo 2"];
    [al2 setLastname:@"Formosp 2"];
    [al2 setCity:@"Coruña 2"];
    [al2 setEmail:@"pablo@pabloformoso.com"];
    
    _alumnos = [[NSMutableArray alloc] initWithCapacity:2];
    [_alumnos addObject:al1];
    [_alumnos addObject:al2];
    
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    
    [defautls setObject:[NSKeyedArchiver archivedDataWithRootObject:_alumnos]
                 forKey:@"array_alumnos"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application { }
- (void)applicationDidEnterBackground:(UIApplication *)application { }
- (void)applicationWillEnterForeground:(UIApplication *)application { }
- (void)applicationDidBecomeActive:(UIApplication *)application { }
- (void)applicationWillTerminate:(UIApplication *)application { }

@end
