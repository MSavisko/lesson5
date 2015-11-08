//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "Game.h"
#import "PlayingCardDeck.h"
#import "GameViewController.h"

@interface GameViewController ()

@property (nonatomic, strong) Game *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *logLabel;
@property (nonatomic) int scoreCount;

@end

@implementation GameViewController

- (void) setScoreCount:(int)scoreCount {
    _scoreCount = scoreCount;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.scoreCount];
}

- (Game *)game {
	if (!_game) {
		_game = [[Game alloc] initWithCardCount:[self.cardButtons count]
									  usingDeck:[[PlayingCardDeck alloc] init]];
	}
	return _game;
}


- (IBAction)cardButtonTapped:(UIButton *)sender {
	NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
	[self.game chooseCardAtIndex:cardIndex];
    self.logLabel.text = [self.game logScore];
    self.scoreCount = [self.game score];
        if (self.game.everyMatchIsDone) {
            if (self.tabBarController) {
                if (self.tabBarController.selectedIndex == 0){
                    [self performSegueWithIdentifier:@"PushGameOver" sender:nil];
                }else if (self.tabBarController.selectedIndex == 1){
                    [self performSegueWithIdentifier:@"ModalGameOver" sender:nil];
                }
            }
        }
    [self updateUI];
    
}


-(void) updateUI {
	for (UIButton *cardButton in self.cardButtons) {
		NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
		Card *card = [self.game cardAtIndex:cardIndex];
		
		[cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
		[cardButton setBackgroundImage:[self backgroundImageForCard:card]
							  forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched && ![self.game everyMatchIsDone];
	}
}


-(NSString *) titleForCard:(Card *)card {
	return (card.isChosen) ? card.contents : @"";
}


-(UIImage *) backgroundImageForCard:(Card *)card {
	return [UIImage imageNamed:(card.isChosen) ? @"cardfront" : @"cardback"];
}


@end
