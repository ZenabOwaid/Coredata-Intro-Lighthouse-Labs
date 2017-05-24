//
//  ViewController.m
//  CoreDataDemoW4D3
//
//  Created by steve on 2017-05-24.
//  Copyright © 2017 steve. All rights reserved.
//

#import "ViewController.h"
#import "Person+CoreDataClass.h"
#import "AppDelegate.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}
- (IBAction)save:(UIBarButtonItem *)sender {
  NSString *fn = self.firstNameTextField.text;
  NSString *ln = self.lastNameTextField.text;
  int16_t age = (int16_t)[self.ageTextField.text intValue];
  Person *person = [[Person alloc] initWithContext:self.context];
  person.firstName = fn;
  person.lastName = ln;
  person.age = age;
  [self.delegate saveContext];
}


@end
