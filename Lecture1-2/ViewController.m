//
//  ViewController.m
//  Lecture1-2
//
//  Created by Student22 on 3/24/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate> {
    NSMutableArray *usernames;
    NSMutableArray *passwords;
}

@property (strong, nonatomic) NSMutableArray *passwords;
@property (strong, nonatomic) NSMutableArray *usernames;

@end

@implementation ViewController

@synthesize usernames;
@synthesize passwords;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.usernames = [[NSMutableArray alloc] init];
    self.passwords = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"Text field is ready for typing.");
    return YES;
}

- (IBAction)checkUser:(id)sender {
    if([self.usernameTextField.text length] != 0 && [self.passwordTextField.text length] != 0) {
        NSString *yourUsername = self.usernameTextField.text;
        NSString *yourPassword = self.passwordTextField.text;
        
        if([self.usernames containsObject: yourUsername] && [self.passwords containsObject: yourPassword]) {
            self.messageLabel.text = @"This is a valid user.";
        }
        else {
            self.messageLabel.text = @"No user found.";
        }
    }
    else {
        self.messageLabel.text = @"Your fields are empty.";
    }
}

- (IBAction)addUser:(id)sender {
    if([self.usernameTextField.text length] != 0 && [self.passwordTextField.text length] != 0) {
        NSString *yourUsername = self.usernameTextField.text;
        NSString *yourPassword = self.passwordTextField.text;
        
        if(![self.usernames containsObject: yourUsername]) {
            [self.usernames addObject: yourUsername];
            [self.passwords addObject: yourPassword];
            
            self.messageLabel.text = @"The user has been added.";
        }
        else {
            self.messageLabel.text = @"This username is taken.";
        }
        
    }
    else {
        self.messageLabel.text = @"Your fields are empty.";
    }
}

@end
