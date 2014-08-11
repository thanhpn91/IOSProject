//
//  InboxTableViewController.h
//  Rabbit
//
//  Created by Thanh Pham on 7/31/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface InboxTableViewController : UITableViewController
@property(nonatomic,strong) NSArray *messages;
@property(nonatomic,strong) PFObject *selectedMessage;
@property(nonatomic,strong) MPMoviePlayerController *moivePlayer;

- (IBAction)LogOut:(id)sender;

@end
