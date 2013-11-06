//
//  GameViewController.h
//  Blackjackz
//
//  Created by João Victor Chencci on 10/10/13.
//  Copyright (c) 2013 João Victor Chencci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Game.h"

@interface GameViewController : UIViewController

//Methods

- (void)generateRdmNumber;
- (IBAction)loadImage:(id)sender;
- (IBAction)getCard:(id)sender;

@end
