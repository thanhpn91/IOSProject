//
//  GameViewController.m
//  FlappyBird
//
//  Created by Thanh Pham on 7/16/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end
@implementation GameViewController
- (void)GameOver{
    
    if(ScoreNumber > HighScoreNumber){
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
}
- (void)Score{
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i",ScoreNumber];
}
- (IBAction)StartGame:(id)sender{
    
    StartGame.hidden = YES;
    TunnelTop.hidden = NO;
    TunnelBottom.hidden = NO;
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    // when button is press, run the method BirdMoving every 0.05s, call bird to move up and down
    
    [self PlaceTunnels]; // run the method call PlaceTunnels
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];                
    
}
- (void)TunnelMoving{
    TunnelTop.center = CGPointMake(TunnelTop.center.x -1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x-1, TunnelBottom.center.y);
    if(TunnelTop.center.x < -28){
        [self PlaceTunnels];
    }
    
    if(TunnelTop.center.x == 30){ // if the tunnel in this position if mean the bird fly thought the tunnel and we will make another rule to check if the bird hit the tunnel ( in this case the game ended)
        [self Score];
    }
    if(CGRectIntersectsRect(Bird.frame, TunnelTop.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, Top.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, Bottom.frame)){
        [self GameOver];
    }
    
}
- (void)PlaceTunnels{
    // we only need to random place the top tunnel, then the bottom tunnel will be set from the top tunnel
    //-228  122 the topest and bottomest position of Y (350 values)
    
    RandomTopTunnelPosition = arc4random() % 350; // random from 1 - 350 then minus it with -228 to get value between -228 -> 122
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 655; // the graph between top and bottom tunnel
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340,RandomBottomTunnelPosition);
}

- (void)BirdMoving{
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    BirdFlight = BirdFlight - 5;
    
    if(BirdFlight < -15) {
        BirdFlight = -15;
    }
    
    if(BirdFlight > 0){
        Bird.image= [UIImage imageNamed:@"BirdUp.png"];
    }
    if(BirdFlight < 0 ){
        Bird.image= [UIImage imageNamed:@"BirdDown.png"];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    BirdFlight = 30;
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
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    HighScoreNumber =[[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
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
