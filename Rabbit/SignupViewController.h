//
//  SignupViewController.h
//  Rabbit
//
//  Created by Thanh Pham on 7/31/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)dissmiss:(id)sender;

- (IBAction)signup:(UIButton *)sender;

@end
