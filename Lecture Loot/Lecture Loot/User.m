//
//  User.m
//  Lecture Loot
//
//  Created by Sydney Richardson on 3/11/14.
//  Copyright (c) 2014 CashU. All rights reserved.
//

#import "User.h"
#import "Wager.h"
#import "Course.h"
#import "Meeting.h"

@interface User()

@end

@implementation User

+ (instancetype)currentUser
{
    static User *currentUser = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currentUser = [[self alloc] initPrivate];
    });
    
    return currentUser;
}

// If a programmer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[User initUserSingletonWithFirstName] with all the user information"
                                 userInfo:nil];
    return nil;
}
                       
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _courses = [[NSMutableArray alloc] init];
        _wagers = [[NSMutableArray alloc] init];
    }
    return self;
}

//this is a private method because we only want the program to call it, to ensure single-tonian
- (void)setUserInformationWithFirstName:(NSString *)firstName
                               lastName:(NSString *)lastName
                               username:(NSString *)username
                           emailAddress:(NSString *)email
                               password:(NSString *)password
                                 points:(int) points
{
    self.firstName = firstName;
    self.lastName = lastName;
    self.username = username;
    self.emailAddress = email;
    self.password = password;
    self.points = points;
}

#pragma Wager add remove get update

- (Wager *)createWager
{
    Wager *newWager = [[Wager alloc] init];
    [self.wagers addObject:newWager];
    
    return newWager;
}

- (void)removeWager:(Wager *)wagerToRemove
{
    [self.wagers removeObjectIdenticalTo:wagerToRemove];
}

- (Wager *)createWagerWithAmount:(int)wagerAmount startingDate:(NSDate *)startingDate
{
    Wager *newWager = [[Wager alloc] init];
    newWager.wagerAmountPerMeeting = wagerAmount;
    newWager.weekOfDate = startingDate;
    
    [self.wagers addObject:newWager];
    
    return newWager;
}

- (NSArray *)allWagers
{
    return [self.wagers copy];
}

#pragma Course add remove get update

- (Course *)createCourse
{
    return nil;
}

- (void)removeCourse:(Course *)courseToRemove
{
    [self.courses removeObjectIdenticalTo:courseToRemove];
}

- (NSArray *)allCourses
{
    return [self.courses copy];
}


@end