//
//  EditFriendsViewController.m
//  Rabbit
//
//  Created by Thanh Pham on 8/1/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import "EditFriendsViewController.h"

@interface EditFriendsViewController ()

@end

@implementation EditFriendsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            self.allUsers = objects;
            NSLog(@"User: %@",self.allUsers);
            [self.tableView reloadData];
        }
        else{
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    self.currentUser = [PFUser currentUser];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            self.allUsers = objects;
            NSLog(@"User: %@",self.allUsers);
            [self.tableView reloadData];
        }
        else{
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    self.currentUser = [PFUser currentUser];

    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allUsers count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if([self isFriend:user]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
-(BOOL)isFriend:(PFUser *)user{
    for(PFUser *friend in self.friends){
        if([friend.objectId isEqualToString:user.objectId]){
            return YES;
        }
    }
    return NO;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    // if user is a friend
    // remove them
    // else add them in a friendlist
    
    if([self isFriend:user]){
        cell.accessoryType = UITableViewCellAccessoryNone;
        for(PFUser *friend in self.friends){
            if([friend.objectId isEqualToString:user.objectId])
                [self.friends removeObject:friend];
                [friendsRelation removeObject:user];
                break;
        }
    }
    else{
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.friends addObject:user];
        [friendsRelation addObject:user];
    }
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(error){
            NSLog(@"Error: %@ %@",error,[error userInfo]);
        }
    }];
    [self.tableView reloadData];
}

@end
