//
//  ViewController.h
//  CoreDataDemoW4D3
//
//  Created by steve on 2017-05-24.
//  Copyright © 2017 steve. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;
@class AppDelegate;

@interface ViewController : UIViewController
@property (nonatomic) NSManagedObjectContext *context;
@property (nonatomic, weak)AppDelegate *delegate;
@end

