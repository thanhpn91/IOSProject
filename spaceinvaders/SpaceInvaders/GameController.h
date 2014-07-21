//
//  GameController.h
//  SpaceInvaders
//
//  Created by Thanh Pham on 7/17/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

int ShipMovement;
int BulletMovement;
int BulletOnScreen;
int MonstersKilled;
BOOL Monster1Hit;
BOOL Monster2Hit;
BOOL Monster3Hit;
BOOL Monster4Hit;
BOOL Monster5Hit;
BOOL Monster6Hit;
BOOL Monster7Hit;
BOOL Monster8Hit;
BOOL Monster9Hit;
BOOL Monster10Hit;
int MonsterMovement;
int MonsterShooterStart;

@interface GameController : UIViewController
{
    IBOutlet UIButton *Start;
    IBOutlet UIButton *Exit;
    IBOutlet UIButton *Shoot;
    
    IBOutlet UIImageView *AirCraft;
//    IBOutlet UIImageView *Monter;
    IBOutlet UIImageView *Bullet;
    
    IBOutlet UIImageView *Monster1;
    IBOutlet UIImageView *Monster2;
    IBOutlet UIImageView *Monster3;
    IBOutlet UIImageView *Monster4;
    IBOutlet UIImageView *Monster5;
    IBOutlet UIImageView *Monster6;
    IBOutlet UIImageView *Monster7;
    IBOutlet UIImageView *Monster8;
    IBOutlet UIImageView *Monster9;
    IBOutlet UIImageView *Monster10;
    
    IBOutlet UIImageView *MonsterBullet1;
    IBOutlet UIImageView *MonsterBullet2;
    IBOutlet UIImageView *MonsterBullet3;
    
    IBOutlet UILabel *WinOrLose;
    
    NSTimer *MovementTimer;
}

-(IBAction)Start:(id)sender;
//-(IBAction)End:(id)sender;
-(IBAction)Shoot:(id)sender;
-(void)Movement;
-(void)MonstersKilled;
-(void)MonsterMoveDown;
-(void)GameOver;
@end
