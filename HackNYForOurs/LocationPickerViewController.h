//
//  LocationPickerViewController.h
//  HackNYForOurs
//
//  Created by Admin on 4/2/16.
//  Copyright (c) 2016 Binary Bros. All rights reserved.
//

#import "ViewController.h"
//#import "CardView.xib"

@interface LocationPickerViewController : UITableViewController 
@property (weak, nonatomic) IBOutlet UIView *cardViewPlaceholder;
@property (nonatomic, strong) NSMutableArray *cardViews; // of CardViews

@end
