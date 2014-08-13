//
//  GameViewController.h
//  FlappyBird
//
//  Created by Thanh Pham on 7/16/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight; // use to tell a bird to move up or down
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;  // Saving and Loading
@interface GameViewController : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UIButton *Exit;
    
    NSTimer * BirdMovement;
    NSTimer * TunnelMovement;
}

- (IBAction)StartGame:(id)sender;
- (void)BirdMoving;
- (void)TunnelMoving;
- (void)PlaceTunnels;
- (void)Score;
- (void)GameOver;

@end
