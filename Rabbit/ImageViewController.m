//
//  ImageViewController.m
//  Rabbit
//
//  Created by Thanh Pham on 8/9/14.
//  Copyright (c) 2014 Thanh Pham. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    PFFile *imageFile =[self.message objectForKey:@"file"];
    NSURL *imageFileURL =[[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.imageView.image = [UIImage imageWithData:imageData];
    NSLog(@" picture %@ ",imageFile.name);
    
    NSString *senderName = [self.message objectForKey:@"senderName"];
    NSString *title= [ NSString stringWithFormat:@"Sent from %@",senderName];
    self.navigationItem.title = title; 
}

-(void)viewDidAppear:(BOOL)animated {
     [super viewWillAppear:animated];
    PFFile *imageFile =[self.message objectForKey:@"file"];
    NSURL *imageFileURL =[[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    if([self respondsToSelector:@selector(timeout)]){
        [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
    }
    else{
        NSLog(@"Error: missing selector missing");
    }
}
-(void)timeout {
   [self.navigationController popViewControllerAnimated:YES];
}


@end
