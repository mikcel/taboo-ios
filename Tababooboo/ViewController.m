//
//  ViewController.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "ViewController.h"
#import "RandomizedWordSequence.h"

@interface ViewController ()
    
@end

@implementation ViewController
{
    WordStore *wordStore;
    RandomizedWordSequence *currentSequence;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self->wordStore = [[WordStore alloc] init];
    // Initializes the word store by reading words in from the json file
    // included with the app.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"json"];
    [self->wordStore loadFromFile:filePath];
    
    self->currentSequence = [[RandomizedWordSequence alloc] initWithWordStore:self->wordStore];
    
    // TODO: Don't actually call begin new round
    [self beginNewRound];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayWord:(Word *)wordToDisplay {
    [self.wordLabel setText: wordToDisplay.word];
    
    NSLog(@"Displaying word %@\n", wordToDisplay.word);
    
    NSArray *prohibitedWords = [wordToDisplay.prohibitedWords allObjects];
    // TODO: shuffle prohibited words
    [self.firstProhibited setText: prohibitedWords[0]];
    [self.secondProhibited setText: prohibitedWords[1]];
    [self.thirdProhibited setText: prohibitedWords[2]];
    [self.fourthProhibited setText: prohibitedWords[3]];
    [self.fifthProhibited setText: prohibitedWords[4]];
}

- (void)beginNewRound
{
    Word *firstWord = [self->currentSequence next];
    [self displayWord: firstWord];
}

@end
