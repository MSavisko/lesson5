//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Maksym Savisko on 11/5/15.
//  Copyright © 2015 Maksym Savisko. All rights reserved.
//

#import "ReminderViewController.h"

@implementation ReminderViewController

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a remainder for %@", date);
}

@end
