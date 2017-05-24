//
//  AppDelegate.h
//  CoreDataDemoW4D3
//
//  Created by steve on 2017-05-24.
//  Copyright © 2017 steve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

