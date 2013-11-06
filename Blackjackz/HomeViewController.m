//
//  HomeViewController.m
//  Blackjackz
//
//  Created by João Victor Chencci on 10/10/13.
//  Copyright (c) 2013 João Victor Chencci. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

//- (id) initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder: aDecoder];
//
//
//    if (self) {
//
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    User *sharedUser = [User sharedUser];
    NSString *valorPote = [NSString stringWithFormat:@"%d", [sharedUser cash]];
    [[self cashLabel] setText:valorPote];
    
    [[User sharedUser] setPoints:0];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pano.jpg"]];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard
{
    Game *sharedGame = [Game sharedGame];
    sharedGame.bet = self.betAmount.text.integerValue;
    [self.betAmount resignFirstResponder];
}

@end
