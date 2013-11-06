//
//  ResultViewController.m
//  Blackjackz
//
//  Created by João Victor Chencci on 10/10/13.
//  Copyright (c) 2013 João Victor Chencci. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UILabel *autoPoints;
@property (weak, nonatomic) IBOutlet UILabel *playerPoints;
@property (weak, nonatomic) IBOutlet UILabel *playerCash;

@end

@implementation ResultViewController

- (id) initWithCoder:(NSCoder *)aDecoder
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithCoder: aDecoder];
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pano.jpg"]];
    
    [self quickGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)generateRdmNumber {
    Game *sharedGame = [Game sharedGame];
    int random;
    int count = 0;
    
    random = 1 + arc4random() % (12);
    for (int i=0; i < [[sharedGame gameStack] count]; i++) {
        if([[sharedGame gameStack] objectAtIndex:i] == [NSString stringWithFormat:@"%d", random]) {
            count+=1;
        }
    }
    
    if (count < 4) {
        [[sharedGame gameStack] addObject:[NSString stringWithFormat:@"%d", random]];
        sharedGame.autoStackCount += 1;
        return random;
    }
    else {
        [self generateRdmNumber];
    }
    return 0;
}

- (IBAction)quickGame {
    User *sharedUser = [User sharedUser];
    Game *sharedGame = [Game sharedGame];

    NSInteger autoPoints = 0;
    NSInteger cardNumber;
    
    int bet = sharedGame.bet;
    
    while (autoPoints < sharedUser.points || autoPoints <= 21) {
        cardNumber = [self generateRdmNumber];
        
        if(cardNumber == 1){
            autoPoints += 1;
        }
        else if(cardNumber > 1 && cardNumber < 10){
            autoPoints += cardNumber;
        }
        else if (cardNumber>=10) {
            autoPoints += 10;
        }
    }
    
    [[self autoPoints] setText:[NSString stringWithFormat:@"%d", autoPoints]];
    [[self playerPoints] setText:[NSString stringWithFormat:@"%d", sharedUser.points]];
    
    if (sharedUser.points == 21) {
        [[self message] setText:@"Você ganhou!"];
        [sharedUser setCash:(sharedUser.cash + (2*bet))];
    }
    else if (autoPoints == 21) {
        [[self message] setText:@"Você perdeu!"];
        [sharedUser setCash:(sharedUser.cash - bet)];
    }
    else if (autoPoints == sharedUser.points) {
        if(sharedGame.playerStackCount <= sharedGame.autoStackCount) {
            [[self message] setText:@"Você ganhou!"];
            [sharedUser setCash:(sharedUser.cash + (2*bet))];
        }
        else {
            [[self message] setText:@"Você perdeu!"];
            [sharedUser setCash:(sharedUser.cash - bet)];
        }

    }
    else if (autoPoints < sharedUser.points) {
        if(sharedUser.points < 21){
            [[self message] setText:@"Você ganhou!"];
            [sharedUser setCash:(sharedUser.cash + (2*bet))];
        }
        else {
            [[self message] setText:@"Você perdeu!"];
            [sharedUser setCash:(sharedUser.cash - bet)];
        }
    }
    else if (autoPoints > sharedUser.points) {
        if(autoPoints < 21){
            [[self message] setText:@"Você perdeu!"];
            [sharedUser setCash:(sharedUser.cash - bet)];
        }
        else {
            [[self message] setText:@"Você ganhou!"];
            [sharedUser setCash:(sharedUser.cash + (2*bet))];
        }
    }
    
    [[self playerCash] setText:[NSString stringWithFormat:@"%d", sharedUser.cash]];
}

@end
