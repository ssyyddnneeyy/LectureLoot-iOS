//
//  LLTabBarController.m
//  Lecture Loot
//
//  Created by Sydney Richardson on 3/11/14.
//  Copyright (c) 2014 CashU. All rights reserved.
//

#import "LLTabBarController.h"
#import "Utilities.h"

@interface LLTabBarController ()

@end

@implementation LLTabBarController

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"init Tab Controller");
        // This is for developement only, until we get the login stuff completed
        [[Utilities sharedUtilities] createAndSetUserInformationWithFirstName:@"FirstName"
                                                                     lastName:@"LastName"
                                                                     username:@"username"
                                                                        email:@"someone@example.com"
                                                                     password:@"password"];
        [self setSelectedIndex:1];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super init];
    if (self) {
        NSLog(@"Init with nib tab bar controller");
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"init with coder Tab Controller");
        // This is for developement only, until we get the login stuff completed
        [[Utilities sharedUtilities] createAndSetUserInformationWithFirstName:@"FirstName"
                                                                     lastName:@"LastName"
                                                                     username:@"username"
                                                                        email:@"someone@example.com"
                                                                     password:@"password"];
        [self setSelectedIndex:1];
    }
    return self;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"View did load Nav controller");
    
}

@end