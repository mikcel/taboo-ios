//
//  Game.m
//  Tababooboo
//
//  Created by Flora on 12/29/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "Game.h"
#import "Round.h"
#import "Team.h"
#import "WordResult.h"

@implementation Game


- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.currTeam = -1;
        self.teams = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

- (void)createNewTeam:(NSString *)teamName
{
    Team *newTeam = [[Team alloc] init];
    newTeam.name = teamName;
    [self.teams addObject:newTeam];
}

- (void)beginNewRound
{
    self.currTeam = (self.currTeam+1)%[self.teams count];
    self.currRound = [[Round alloc] init];
}

- (void)updateRound:(Word *)word :(bool)correct
{
    WordResult* wr = [[WordResult alloc] init];
    wr.correct = correct;
    wr.word = word;
    [self.currRound.wordList addObject:wr];
}

- (void)updateTeam:(int)ptsToAdd
{
    Team* t = [self.teams objectAtIndex:self.currTeam];
    t.points += ptsToAdd;
}

@end