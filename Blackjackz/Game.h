//
//  Game.h
//  Blackjackz
//
//  Created by João Victor Chencci on 11/10/13.
//  Copyright (c) 2013 João Victor Chencci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject\

@property (strong, nonatomic) NSMutableArray *gameStack;
@property (nonatomic) int playerStackCount;
@property (nonatomic) int autoStackCount;
@property (nonatomic) int bet;

+ (id) sharedGame;

@end
