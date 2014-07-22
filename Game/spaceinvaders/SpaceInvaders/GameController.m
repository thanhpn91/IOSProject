//
//  GameController.m
//  SpaceInvaders
//
//  Created by Thanh Pham on 7/17/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import "GameController.h"

@interface GameController ()

@end

@implementation GameController

-(void)GameOver
{
    WinOrLose.text = [NSString stringWithFormat:@"Your Lose!"];
    WinOrLose.hidden = NO;
    Monster1.hidden = YES;
    Monster2.hidden = YES;
    Monster3.hidden = YES;
    Monster4.hidden = YES;
    Monster5.hidden = YES;
    Monster6.hidden = YES;
    Monster7.hidden = YES;
    Monster8.hidden = YES;
    Monster9.hidden = YES;
    Monster10.hidden = YES;
    MonsterBullet1.hidden = YES;
    MonsterBullet2.hidden = YES;
    MonsterBullet3.hidden = YES;
    Start.hidden = NO;
    Exit.hidden = NO;
    Bullet.hidden = YES;
    Shoot.hidden = YES;
    AirCraft.hidden = YES;    
    
    [MovementTimer invalidate];
}
- (void)MonsterMoveDown{
    
    Monster1.center = CGPointMake(Monster1.center.x, Monster1.center.y + 5);
    Monster2.center = CGPointMake(Monster2.center.x, Monster2.center.y + 5);
    Monster3.center = CGPointMake(Monster3.center.x, Monster3.center.y + 5);
    Monster4.center = CGPointMake(Monster4.center.x, Monster4.center.y + 5);
    Monster5.center = CGPointMake(Monster5.center.x, Monster5.center.y + 5);
    Monster6.center = CGPointMake(Monster6.center.x, Monster6.center.y + 5);
    Monster7.center = CGPointMake(Monster7.center.x, Monster7.center.y + 5);
    Monster8.center = CGPointMake(Monster8.center.x, Monster8.center.y + 5);
    Monster9.center = CGPointMake(Monster9.center.x, Monster9.center.y + 5);
    Monster10.center = CGPointMake(Monster10.center.x, Monster10.center.y + 5);
   
}
-(void)MonstersKilled{
    MonstersKilled = MonstersKilled +1; 
    BulletOnScreen = 0;
    BulletMovement =0;
    Bullet.hidden = YES;
    Bullet.center = CGPointMake(204, 556);
    if(MonstersKilled == 10){
        WinOrLose.text = [NSString stringWithFormat:@"Your Win!"];
        WinOrLose.hidden = NO;
        Start.hidden = NO;
        Exit.hidden = NO;
        AirCraft.hidden = YES;
        Bullet.hidden = YES;
        Shoot.hidden = YES;		
    }
    
}
-(IBAction)Shoot:(id)sender{
    if(BulletOnScreen == 0){
        Bullet.hidden = NO;
        Bullet.center = CGPointMake(AirCraft.center.x, AirCraft.center.y + 10);
        BulletOnScreen = BulletOnScreen + 1;
        BulletMovement = 7;
    }
    
}
-(void)Movement{
    
    [self Collison]; // every 0.05s we have to check for collosion
    
    AirCraft.center = CGPointMake(AirCraft.center.x + ShipMovement, AirCraft.center.y);
    Bullet.center = CGPointMake(Bullet.center.x, Bullet.center.y - BulletMovement);
    
    // Monsters move down by MonsterMovement distance
    Monster1.center = CGPointMake(Monster1.center.x + MonsterMovement ,Monster1.center.y);
    Monster2.center = CGPointMake(Monster2.center.x + MonsterMovement ,Monster2.center.y);
    Monster3.center = CGPointMake(Monster3.center.x + MonsterMovement ,Monster3.center.y);
    Monster4.center = CGPointMake(Monster4.center.x + MonsterMovement ,Monster4.center.y);
    Monster5.center = CGPointMake(Monster5.center.x + MonsterMovement ,Monster5.center.y);
    Monster6.center = CGPointMake(Monster6.center.x + MonsterMovement ,Monster6.center.y);
    Monster7.center = CGPointMake(Monster7.center.x + MonsterMovement ,Monster7.center.y);
    Monster8.center = CGPointMake(Monster8.center.x + MonsterMovement ,Monster8.center.y);
    Monster9.center = CGPointMake(Monster9.center.x + MonsterMovement ,Monster9.center.y);
    Monster10.center = CGPointMake(Monster10.center.x + MonsterMovement ,Monster10.center.y);
    MonsterBullet1.center = CGPointMake(MonsterBullet1.center.x, MonsterBullet1.center.y + 10);
    MonsterBullet2.center = CGPointMake(MonsterBullet2.center.x, MonsterBullet2.center.y + 10);
    MonsterBullet3.center = CGPointMake(MonsterBullet3.center.x, MonsterBullet3.center.y + 10);
    
    if(MonsterBullet1.center.y > 578){
        MonsterShooterStart = arc4random() % 315;
        MonsterBullet1.center = CGPointMake(MonsterShooterStart, 0);
    }
    if(MonsterBullet2.center.y > 578){
        MonsterShooterStart = arc4random() % 315;
        MonsterBullet2.center = CGPointMake(MonsterShooterStart, 0);
    }
    if(MonsterBullet3.center.y > 578 ){
        MonsterShooterStart = arc4random() % 315;
        MonsterBullet3.center = CGPointMake(MonsterShooterStart, 0);
    }
    
    if(Bullet.center.y < -10){
        Bullet.hidden = 0;
        BulletMovement = 0;
        BulletOnScreen = 0;
    }
    
    if((Monster1.center.x < 15) && (Monster1Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster2.center.x < 15) && (Monster2Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster3.center.x < 15) && (Monster3Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster4.center.x < 15) && (Monster4Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster5.center.x < 15) && (Monster5Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster6.center.x < 15) && (Monster6Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster7.center.x < 15) && (Monster7Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster8.center.x < 15) && (Monster8Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster9.center.x < 15) && (Monster9Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    } else if((Monster10.center.x < 15) && (Monster10Hit == NO)){
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }else if((Monster1.center.x > 305) && (Monster1Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster2.center.x > 305) && (Monster2Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster3.center.x > 305) && (Monster3Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster4.center.x > 305) && (Monster4Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster5.center.x > 305) && (Monster5Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster6.center.x > 305) && (Monster6Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster7.center.x > 305) && (Monster7Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster8.center.x > 305) && (Monster8Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster9.center.x > 305) && (Monster9Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } else if((Monster10.center.x > 305) && (Monster10Hit == NO)){
        MonsterMovement = -5;
        [self MonsterMoveDown];
    } 
}
-(void)Collison{
    if(CGRectIntersectsRect(MonsterBullet1.frame, AirCraft.frame))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(MonsterBullet2.frame, AirCraft.frame))
    {
        [self GameOver];    
    }
    if(CGRectIntersectsRect(MonsterBullet3.frame, AirCraft.frame))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster1.frame, AirCraft.frame) && (Monster1Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster2.frame, AirCraft.frame) && (Monster2Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster3.frame, AirCraft.frame) && (Monster3Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster4.frame, AirCraft.frame) && (Monster4Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster5.frame, AirCraft.frame) && (Monster5Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster6.frame, AirCraft.frame) && (Monster6Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster7.frame, AirCraft.frame) && (Monster7Hit == NO))
    {
        [self GameOver];
    }if(CGRectIntersectsRect(Monster8.frame, AirCraft.frame) && (Monster8Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster9.frame, AirCraft.frame) && (Monster9Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Monster10.frame, AirCraft.frame) && (Monster10Hit == NO))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster1.frame) && (Monster1Hit ==0))
    {
        Monster1.hidden = YES;
        Monster1Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster2.frame) && (Monster2Hit ==0))
    {
        Monster2.hidden = YES;
        Monster2Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster3.frame) && (Monster3Hit ==0))
    {
        Monster3.hidden = YES;
        Monster3Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster4.frame) && (Monster4Hit ==0))
    {
        Monster4.hidden = YES;
        Monster4Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster5.frame) && (Monster5Hit ==0))
    {
        Monster5.hidden = YES;
        Monster5Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster6.frame) && (Monster6Hit ==0))
    {
        Monster6.hidden = YES;
        Monster6Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster7.frame) && (Monster7Hit ==0))
    {
        Monster7.hidden = YES;
        Monster7Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster8.frame) && (Monster8Hit ==0))
    {
        Monster8.hidden = YES;
        Monster8Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster9.frame) && (Monster9Hit ==0))
    {
        Monster9.hidden = YES;
        Monster9Hit = YES;
        [self MonstersKilled];
    }
    if(CGRectIntersectsRect(Bullet.frame, Monster10.frame) && (Monster10Hit ==0))
    {
        Monster10.hidden = YES;
        Monster10Hit = YES;
        [self MonstersKilled];
    }
}
-(IBAction)Start:(id)sender{
    
    Start.hidden = YES;
    Exit.hidden = YES;
    Shoot.hidden = NO;
    
    MovementTimer =[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Movement) userInfo:nil repeats:YES];

    // all the monsters appear when users press start button.
    
    Monster1.hidden = NO;
    Monster2.hidden = NO;
    Monster3.hidden = NO;
    Monster4.hidden = NO;
    Monster5.hidden = NO;
    Monster6.hidden = NO;
    Monster7.hidden = NO;
    Monster8.hidden = NO;
    Monster9.hidden = NO;
    Monster10.hidden = NO;
    
    MonsterBullet1.hidden = NO;
    MonsterBullet2.hidden = NO;
    MonsterBullet3.hidden = NO;
    
    MonsterShooterStart = arc4random() % 315;
    MonsterBullet1.center = CGPointMake(MonsterShooterStart, 0);
    
    MonsterShooterStart = arc4random() % 315;
    MonsterBullet2.center = CGPointMake(MonsterShooterStart, -150);
    
    MonsterShooterStart = arc4random() % 315;
    MonsterBullet3.center = CGPointMake(MonsterShooterStart, -300);
   }
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{ // running code every time we touch the screen
    UITouch * touch = [touches anyObject]; // touch anywhere in screen
    CGPoint point = [touch locationInView:self.view];
    
    if(point.x < 160){
        ShipMovement = -7;
    }
    else{
        ShipMovement = 7;
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    ShipMovement =0;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    Bullet.hidden = YES;
    Shoot.hidden = YES;
    MonsterMovement = 5;
    // By convention, it will be set to true if uses don't set it, but we must reset when we start the game again
    Monster1Hit = NO;
    Monster2Hit = NO;
    Monster3Hit = NO;
    Monster4Hit = NO;
    Monster5Hit = NO;
    Monster6Hit = NO;
    Monster7Hit = NO;
    Monster8Hit = NO;
    Monster9Hit = NO;
    Monster10Hit = NO;
    
    // all monsters are hidden in the beginning
    Monster1.hidden = YES;
    Monster2.hidden = YES;
    Monster3.hidden = YES;
    Monster4.hidden = YES;
    Monster5.hidden = YES;
    Monster6.hidden = YES;
    Monster7.hidden = YES;
    Monster8.hidden = YES;
    Monster9.hidden = YES;
    Monster10.hidden = YES;
    
    MonsterBullet1.hidden = YES;
    MonsterBullet2.hidden = YES;
    MonsterBullet3.hidden = YES;
    WinOrLose.hidden = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
