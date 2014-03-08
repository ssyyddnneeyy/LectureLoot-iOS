//
//  DashboardViewController.m
//  Lecture Loot
//
//  Created by Sydney Richardson on 3/1/14.
//  Copyright (c) 2014 CashU. All rights reserved.
//

#import "DashboardViewController.h"
#import "Meeting.h"

@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *userPointsLabel;
@property (weak, nonatomic) IBOutlet UIView *day1View;
@property (weak, nonatomic) IBOutlet UIView *day2View;
@property (weak, nonatomic) IBOutlet UIView *day3View;
@property (weak, nonatomic) IBOutlet UIView *day4View;
@property (weak, nonatomic) IBOutlet UIView *day5View;

@property (weak, nonatomic) IBOutlet UIView *checkInStateContainer;
@property (weak, nonatomic) IBOutlet UIButton *checkInButton;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) NSTimer *timer;
@property (strong, nonatomic) Meeting *upcomingMeeting;

- (IBAction)checkIn:(id)sender;

typedef enum  {
    UserNeedsToCheckIn = 0,
    UserHasUpcomingMeeting = 1,
    UserIsDoneForDay = 2,
    UserCheckedIn = 3
} UserCheckInState;
@property (nonatomic) UserCheckInState checkInState;

@end

@implementation DashboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //userCheckInStateView
    self.checkInState = UserNeedsToCheckIn;
    
    
}

- (IBAction)checkIn:(id)sender {
    
    // get the user's location
    // check with the database if it's right
    // if check in was good, enable user checked in
    // else display a message to the user that something went wrong

    [self enableUserCheckedInView];
}

- (IBAction)toggleCheckInStateForTesting:(id)sender
{
    switch (self.checkInState) {
        case UserNeedsToCheckIn:
            self.checkInState = UserHasUpcomingMeeting;
            break;
        case UserHasUpcomingMeeting:
            self.checkInState = UserIsDoneForDay;
            break;
        case UserIsDoneForDay:
            self.checkInState = UserCheckedIn;
            break;
        case UserCheckedIn:
            self.checkInState = UserNeedsToCheckIn;
            break;
        default:
            break;
    }
    [self updateUI];
}

- (void)updateUI
{
    switch (self.checkInState) {
        case UserNeedsToCheckIn:
            [self enableNeedsToCheckInView];
            break;
        case UserCheckedIn:
            [self enableUserCheckedInView];
            break;
        case UserHasUpcomingMeeting:
            [self enableHasUpcomingMeetingView];
            break;
        case UserIsDoneForDay:
            [self enableUserIsDoneForDayView];
            break;
        default:
            break;
    }
}

- (void)enableNeedsToCheckInView
{
    //background red and the countdown label is red bold
    self.checkInStateContainer.backgroundColor = [[UIColor alloc] initWithRed:1.0
                                                                        green:0.86
                                                                         blue:0.9137
                                                                        alpha:1.0];
    [self.checkInButton setHidden:NO];
    [self.countdownLabel setHidden:NO];
    [self.countdownLabel setTextColor:[UIColor redColor]];
    [self.countdownLabel setFont:[UIFont boldSystemFontOfSize:44]];
    
    [self.courseLabel setHidden:NO];
    [self.locationLabel setHidden:NO];
}

- (void)enableHasUpcomingMeetingView
{
    self.checkInStateContainer.backgroundColor = [UIColor clearColor];
    [self.checkInButton setHidden:YES];
    [self.countdownLabel setHidden:NO];
    [self.countdownLabel setTextColor:[UIColor blackColor]];
    [self.countdownLabel setFont:[UIFont systemFontOfSize:44]];
    
    [self.courseLabel setHidden:NO];
    [self.locationLabel setHidden:NO];
}

- (void)enableUserIsDoneForDayView
{
    self.checkInStateContainer.backgroundColor = [UIColor clearColor];
    [self.checkInButton setHidden:YES];
    [self.countdownLabel setHidden:YES];
    [self.courseLabel setHidden:YES];
    [self.locationLabel setHidden:YES];
}

- (void)enableUserCheckedInView
{
    self.checkInStateContainer.backgroundColor = [[UIColor alloc] initWithRed:0.5294
                                                                        green:0.894
                                                                         blue:0.5843
                                                                        alpha:1.0];
    [self.checkInButton setHidden:YES];
    [self.countdownLabel setHidden:YES];
    [self.courseLabel setHidden:YES];
    [self.locationLabel setHidden:YES];
}

@end
