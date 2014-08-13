//
//  LoginViewController.h
//  Rabbit
//
//  Created by Thanh Pham on 7/31/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UIButton *signup;
@property (weak, nonatomic) IBOutlet UITextField *SignupUsername;
@property (weak, nonatomic) IBOutlet UITextField *SignupPassword;
- (IBAction)Login:(id)sender;

@end
