//
//  FriendsViewController.h
//  Rabbit
//
//  Created by Thanh Pham on 8/1/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface FriendsViewController : UITableViewController
@property(nonatomic,strong) PFRelation *friendsRelation;
@property(nonatomic,strong) NSArray *friends;

@end
