//
//  FriendsViewController.m
//  Rabbit
//
//  Created by Thanh Pham on 8/1/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import "FriendsViewController.h"
#import "EditFriendsViewController.h"
#import "GravatarUrlBuilder.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friendsRelation = [[PFUser currentUser] objectForKey:@"friendsRelation"];
    PFQuery *query = [self.friendsRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"Error %@ %@",error,[error userInfo]);
        }
        else{
            self.friends = objects;
            [self.tableView reloadData];
        }
    }];


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    PFQuery *query = [self.friendsRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"Error %@ %@",error,[error userInfo]);
        }
        else{
            self.friends = objects;
            [self.tableView reloadData];
        }
    }];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showEditFriends"]){
        EditFriendsViewController *viewController = (EditFriendsViewController *)segue.destinationViewController;
        viewController.friends = [ NSMutableArray arrayWithArray:self.friends];
    }  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [self.friends count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
    // 1. Get email address
    NSString *email = [user objectForKey:@"email"];
    
    // 2. Create the md5 hash
    NSURL *gravatarURL = [GravatarUrlBuilder getGravatarUrl:@"email"];
    
    // 3. Request the image from Gravatar
    NSData *imageData = [NSData dataWithContentsOfURL:gravatarURL];
    
    if(imageData != nil){
        dispatch_async(dispatch_get_main_queue(), ^{
            //4. Set image in cell
            cell.imageView.image = [UIImage imageWithData:imageData];
            [cell setNeedsLayout];
        });  
    }
        
    });
   
    cell.imageView.image = [UIImage imageNamed:@"icon_person"];
    return cell;
}



@end
