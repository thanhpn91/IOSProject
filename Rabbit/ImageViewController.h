//
//  ImageViewController.h
//  Rabbit
//
//  Created by Thanh Pham on 8/9/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController
@property (nonatomic,strong) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
