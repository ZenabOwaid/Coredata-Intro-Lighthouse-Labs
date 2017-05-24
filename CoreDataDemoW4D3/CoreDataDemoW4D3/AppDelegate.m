//
//  AppDelegate.m
//  CoreDataDemoW4D3
//
//  Created by steve on 2017-05-24.
//  Copyright © 2017 steve. All rights reserved.
//

#import "AppDelegate.h"
#import "Person+CoreDataClass.h"
//#import "Person+CoreDataProperties.h"

/*
 CRUD
 * Create
 * Read/fetch
 - Simple
 - Sorted Fetch
 - Filtered Fetch
 * Update
 * Delete
 */

/*
 
 */

@interface AppDelegate ()
@property (nonatomic) NSManagedObjectContext *context;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.context = self.persistentContainer.viewContext;
//  [self createData];
//  [self basicFetch];
//  [self fetchWithSort];
//  [self fetchWithFilter];
//  [self updatePersons];
//  [self deletePerson];
  return YES;
}

- (void)createData {
  Person *p1 = [[Person alloc] initWithContext:self.context];
  p1.firstName = @"Fred";
  p1.lastName = @"Flintstone";
  p1.age = 80;
  
  Person *p2 = [[Person alloc] initWithContext:self.context];
  p2.firstName = @"Iggy";
  p2.lastName = @"Pop";
  p2.age = 70;
  
  Person *p3 = [[Person alloc] initWithContext:self.context];
  p3.firstName = @"Mugsy";
  p3.lastName = @"Wort";
  p3.age = 20;
  
  [self saveContext];
  
}

/*
- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(NSError * _Nullable *)error;
*/
- (void)basicFetch {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
  NSArray<Person*>*persons = [self.context executeFetchRequest:request error:nil];
  [self printResultsFromArray:persons];
}

- (void)fetchWithSort {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
  NSSortDescriptor *ageDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:NO];
  request.sortDescriptors = @[ageDescriptor];
  NSArray <Person *>*results = [self.context executeFetchRequest:request error:nil];
  [self printResultsFromArray:results];
}

- (NSArray <Person *>*)fetchWithFilter {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age > 70"];
  request.predicate = predicate;
  NSArray <Person *>* persons = [self.context executeFetchRequest:request error:nil];
  [self printResultsFromArray:persons];
  return persons;
}

- (void)updatePersons {
  Person *fred = [self fetchWithFilter][0];
  fred.age = 81;
  [self saveContext];
}

- (void)deletePerson {
  Person *fred = [self fetchWithFilter][0];
  [self.context deleteObject:fred];
  [self saveContext];
}

- (void)printResultsFromArray:(NSArray <Person *>*)persons {
  for (Person *person in persons) {
    NSLog(@"%@ %@ is %@ years old", person.firstName, person.lastName, @(person.age));
  }
}



#pragma mark - Core Data Stack

- (void)applicationWillTerminate:(UIApplication *)application {
  [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
  @synchronized (self) {
    if (_persistentContainer == nil) {
      _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreDataDemoW4D3"];
      [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        if (error != nil) {
          NSLog(@"Unresolved error %@, %@", error, error.userInfo);
          abort();
        }
      }];
    }
  }
  
  return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSError *error = nil;
  if ([self.context hasChanges] && ![self.context save:&error]) {
    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
    abort();
  }
}

@end
