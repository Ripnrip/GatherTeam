//
//  OverlayView.h
//  BIZTinderCardStack
//
//  Created by IgorBizi@mail.ru on 5/19/15.
//  Copyright (c) 2015 IgorBizi@mail.ru. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    OverlayApprove = 1,
    OverlayReject
} OverlayMode;


// * Class with Overlay of signs approve/reject and dark background 
@interface OverlayView : UIView

// * Mode of sign
@property (nonatomic) OverlayMode mode;
- (void)setSignsTransperancy:(CGFloat)transperancy;
- (void)setBackgroundTransperancy:(CGFloat)transperancy;

@property (nonatomic, strong) UIImage *rightImage;
@property (nonatomic, strong) UIImage *leftImage;
@property (strong, nonatomic)  UIImage *venueImageView;


@property(nonatomic,strong)NSString*venueName;
@property(nonatomic,strong)NSString*venueLocation;
@property(nonatomic,strong)NSString*venueType;


@end
