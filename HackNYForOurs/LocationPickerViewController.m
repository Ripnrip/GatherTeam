//
//  LocationPickerViewController.m
//  HackNYForOurs
//
//  Created by Admin on 4/2/16.
//  Copyright (c) 2016 Binary Bros. All rights reserved.
//

#import "LocationPickerViewController.h"
#import "DraggableCardView.h"
#import "Foursquare2.h"
//NSString const *foursquareClientKey = @"D1J2JPJHUMC3URJSZDZOOYSFX0VOBN4KSFDTKBOYF01U540D";
//NSString const *foursquareClientSecret = @"BM2HIPBJH5XWTTX3CUVJJ0ZZUHGBXV5Y2254SNSBYCE1WYGQ";


@interface LocationPickerViewController ()


@property (nonatomic, strong) NSMutableArray *allVenues; // of restaurants
@property (nonatomic,strong)NSData*connectionData;
@end

@implementation LocationPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    
    self.cardViews = [NSMutableArray array];
    self.cardViewPlaceholder.hidden = YES;
    
   // [self getData];

    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
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
