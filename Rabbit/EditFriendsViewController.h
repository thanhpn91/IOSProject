//
//  EditFriendsViewController.h
//  Rabbit
//
//  Created by Thanh Pham on 8/1/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface EditFriendsViewController : UITableViewController
@property(nonatomic,strong) NSArray *allUsers;
@property(nonatomic,strong) PFUser *currentUser;
@property(nonatomic,strong) NSMutableArray *friends;

-(BOOL)isFriend:(PFUser *)user;
@end
