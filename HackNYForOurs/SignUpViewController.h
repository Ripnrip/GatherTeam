//
//  SignUpViewController.h
//  HackNYForOurs
//
//  Created by Admin on 4/2/16.
//  Copyright (c) 2016 Binary Bros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
