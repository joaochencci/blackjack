//
//  Game.m
//  Blackjackz
//
//  Created by João Victor Chencci on 11/10/13.
//  Copyright (c) 2013 João Victor Chencci. All rights reserved.
//

#import "Game.h"

@implementation Game

//+ (id)sharedGame {
//    static Game *sharedGame = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedGame = [[self alloc] init];
//    });
//    return sharedGame;
//}

+(id)sharedGame
{
    static Game *sharedGame = nil;
    @synchronized([Game class])
    {
        if (!sharedGame)
            sharedGame = [[self alloc] init];
        
        return sharedGame;
    }
    return nil;
}

- (id)init {
    if (self = [super init]) {
        self.playerStackCount = 0;
        self.autoStackCount = 0;
        self.bet = 0;
        self.gameStack = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
