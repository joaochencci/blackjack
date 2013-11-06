//
//  User.h
//  Blackjackz
//
//  Created by João Victor Chencci on 10/10/13.
//  Copyright (c) 2013 João Victor Chencci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) NSInteger cash;
@property (nonatomic) NSInteger points;

+ (id) sharedUser;

@end
