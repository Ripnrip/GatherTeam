//
//  SignUpViewController.m
//  HackNYForOurs
//
//  Created by Admin on 4/2/16.
//  Copyright (c) 2016 Binary Bros. All rights reserved.
//

#import "SignUpViewController.h"
#import "FoodCategoryViewController.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
