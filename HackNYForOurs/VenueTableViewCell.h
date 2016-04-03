//
//  VenueTableViewCell.h
//  HackNYForOurs
//
//  Created by Admin on 4/3/16.
//  Copyright (c) 2016 Binary Bros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *venueImageView;
@property (strong, nonatomic) IBOutlet UILabel *venueName;
@property (strong, nonatomic) IBOutlet UILabel *venueLocation;
@property (strong, nonatomic) IBOutlet UILabel *venueType;
@property(nonatomic,strong) NSURL * venueURL;
- (IBAction)moreInfo:(id)sender;
@end
