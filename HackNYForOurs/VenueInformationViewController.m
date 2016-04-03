//
//  VenueInformationViewController.m
//  HackNYForOurs
//
//  Created by Admin on 4/3/16.
//  Copyright (c) 2016 Binary Bros. All rights reserved.
//

#import "VenueInformationViewController.h"

@interface VenueInformationViewController ()

@end

@implementation VenueInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest*request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://foursquare.com/v/la-colombe-torrefaction/49ee02e9f964a52010681fe3"]];
    [self.safariView loadRequest:request];
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
