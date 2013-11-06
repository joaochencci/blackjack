//
//  GameViewController.m
//  Blackjackz
//
//  Created by João Victor Chencci on 10/10/13.
//  Copyright (c) 2013 João Victor Chencci. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@property (nonatomic) int cardNumber;
@property (nonatomic) int playerPoints;
@property (strong, nonatomic) IBOutlet UILabel *points;
@property (strong, nonatomic) IBOutlet UIImage *img;

@end

@implementation GameViewController

- (id) initWithCoder:(NSCoder *)aDecoder
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithCoder:aDecoder];
    User *sharedUser = [User sharedUser];
    
    if (self) {
        self.points.text = [NSString stringWithFormat:@"%d", sharedUser.points];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pano.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)generateRdmNumber {
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
        self.cardNumber = random;
        self.img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", random]];
        [[sharedGame gameStack] addObject:[NSString stringWithFormat:@"%d", random]];
        sharedGame.playerStackCount += 1;
    }
    else {
        [self generateRdmNumber];
    }
}

- (IBAction)loadImage:(id)sender {
    
}

- (IBAction)getCard:(id)sender {
    User *sharedUser = [User sharedUser];
    
    [self generateRdmNumber];
   
    if(self.cardNumber == 1){
        sharedUser.points += 1;
    }
    else if(self.cardNumber > 1 && self.cardNumber < 10){
        sharedUser.points += self.cardNumber;
    }
    else if (self.cardNumber>=10) {
        sharedUser.points += 10;
    }

    self.points.text = [NSString stringWithFormat:@"%d", sharedUser.points];
}

@end
