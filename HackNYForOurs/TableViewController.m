//
//  TableViewController.m
//  DRCellSlideGestureRecognizer
//
//  Created by David Román Aguirre on 12/5/15.
//
//

#import "TableViewController.h"

#import "DRCellSlideGestureRecognizer.h"

NSString * const cellReuseIdentifier = @"Cell Reuse Identifier";

NSString * const stringForCell1 = @"Push left actions";
NSString * const stringForCell2 = @"Pull right actions";
NSString * const stringForCell3 = @"Left and right actions";
NSString * const stringForCell4 = @"Elastic left and right actions";

@interface TableViewController () {
	NSMutableArray *strings;
    int currentIndex;
    int swipeCount;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    currentIndex=0;
    swipeCount=0;
    [super viewDidLoad];
    self.tableView.allowsSelection=NO;
	self.title = @"DRCellSlideGestureRecognizer";
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(resetCells)];
	self.tableView.tableFooterView = [UIView new];
	self.tableView.rowHeight = 60;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
	
	[self resetCells];
}

- (void)resetCells {
	strings = [NSMutableArray arrayWithObjects:@"stumptown", @"", @"think", @"", nil];
	
	[self.tableView beginUpdates];
	[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
	[self.tableView endUpdates];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return strings.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 540;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"venueTableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"venueTableViewCell"];
    }
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
	//cell.textLabel.text = self.venues[indexPath.row][@"name"];
    
    NSLog(@"the url for the image is %@",self.venues[indexPath.row][@"icon"][@"prefix"]);
    
    
    UIImageView*iv=[[UIImageView alloc]initWithFrame:cell.frame];

    
    if([self.venues[indexPath.row][@"name"] isEqualToString:@"Stumptown Coffee Roasters"]){
        [iv setImage:[UIImage imageNamed:@"venue1"]];
        [cell setBackgroundView:iv];
    }
    if([self.venues[indexPath.row][@"name"] isEqualToString:@"Toby's Estate Coffee"]){
        [iv setImage:[UIImage imageNamed:@"venue2"]];
        [cell setBackgroundView:iv];
    }
    if([self.venues[indexPath.row][@"name"] isEqualToString:@"Gimme! Coffee"]){
        [iv setImage:[UIImage imageNamed:@"venue03"]];
        [cell setBackgroundView:iv];
    }
    if([self.venues[indexPath.row][@"name"] isEqualToString:@"Think Coffee"]){
        [iv setImage:[UIImage imageNamed:@"venue04"]];
        [cell setBackgroundView:iv];
    }
    if([self.venues[indexPath.row][@"name"] isEqualToString:@"Third Rail Coffee"]){
        [iv setImage:[UIImage imageNamed:@"thirdRailCoffee"]];
        [cell setBackgroundView:iv];
    }
    
    

    
    UILabel*venueName=[[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+18, cell.frame.origin.y+ 270, 250, 30)];
    [venueName setText:self.venues[indexPath.row][@"name"]];
    [venueName setTextColor:[UIColor whiteColor]];
   // [cell addSubview:venueName];
    
    UILabel*venueLocation=[[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+18, cell.frame.origin.y+ 300, 250, 30)];
    [venueLocation setText:self.venues[indexPath.row][@"location"][@"address"]];
    [venueLocation setTextColor:[UIColor whiteColor]];

   // [cell addSubview:venueLocation];
    
    
   // UILabel*venueType=[[UILabel alloc]initWithFrame:CGRectMake(18, 330, 200, 30)];
   // [venueType setText:self.venues[indexPath.row][@"location"][@"address"]];
   // [cell addSubview:venueType];
    
    static NSString *simpleTableIdentifier = @"venueTableViewCell";
    
    /*
    VenueTableViewCell *cell = (VenueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
        
    {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"VenueTableViewCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    
    cell.venueName = [self.venues objectAtIndex:1][@"name"];
    cell.venueName = @"sdasda";
    */
	DRCellSlideGestureRecognizer *slideGestureRecognizer = [DRCellSlideGestureRecognizer new];
	
	UIColor *greenColor = [UIColor colorWithRed:91/255.0 green:220/255.0 blue:88/255.0 alpha:1];
	UIColor *redColor = [UIColor colorWithRed:222/255.0 green:61/255.0 blue:14/255.0 alpha:1];
	UIColor *blueColor = [UIColor colorWithRed:14/255.0 green:182/255.0 blue:222/255.0 alpha:1];
	
	UIColor *yellowColor = [UIColor colorWithRed:254/255.0 green:217/255.0 blue:56/255.0 alpha:1];
	UIColor *brownColor = [UIColor colorWithRed:206/255.0 green:149/255.0 blue:98/255.0 alpha:1];
	UIColor *purpleColor = [UIColor colorWithRed:148/255.0 green:14/255.0 blue:222/255.0 alpha:1];
	
	DRCellSlideAction *squareAction = [DRCellSlideAction actionForFraction:0.25];
	squareAction.icon = [UIImage imageNamed:@"square"];
	squareAction.activeBackgroundColor = greenColor;
	
	DRCellSlideAction *circleAction = [DRCellSlideAction actionForFraction:0.5];
	circleAction.icon = [UIImage imageNamed:@"circle"];
	circleAction.activeBackgroundColor = [UIColor redColor];
	
	DRCellSlideAction *roundedSquareAction = [DRCellSlideAction actionForFraction:0.75];
	roundedSquareAction.icon = [UIImage imageNamed:@"rounded-square"];
	roundedSquareAction.activeBackgroundColor = blueColor;
	
	DRCellSlideAction *triangleAction = [DRCellSlideAction actionForFraction:-0.25];
	triangleAction.icon = [UIImage imageNamed:@"triangle"];
	triangleAction.activeBackgroundColor = [UIColor redColor];
	
	DRCellSlideAction *octagonAction = [DRCellSlideAction actionForFraction:-0.5];
	octagonAction.icon = [UIImage imageNamed:@"octagon"];
	octagonAction.activeBackgroundColor = [UIColor greenColor];
	
	DRCellSlideAction *starAction = [DRCellSlideAction actionForFraction:-0.75];
	starAction.icon = [UIImage imageNamed:@"star"];
	starAction.activeBackgroundColor = purpleColor;
	

    
    squareAction.behavior = circleAction.behavior = roundedSquareAction.behavior = DRCellSlideActionPushBehavior;
    squareAction.didTriggerBlock = circleAction.didTriggerBlock = roundedSquareAction.didTriggerBlock = [self pushTriggerBlock];
    
    triangleAction.behavior = octagonAction.behavior = starAction.behavior = DRCellSlideActionPullBehavior;
    triangleAction.didTriggerBlock = octagonAction.didTriggerBlock = starAction.didTriggerBlock = [self pushTriggerBlock];
    
    [slideGestureRecognizer addActions:@[squareAction,triangleAction]];
    
	[cell addGestureRecognizer:slideGestureRecognizer];
    
    return cell;
}

- (DRCellSlideActionBlock)pushTriggerBlock {
	return ^(UITableView *tableView, NSIndexPath *indexPath) {
		[strings removeObjectAtIndex:indexPath.row];
		[tableView beginUpdates];
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
		[tableView endUpdates];
        swipeCount++;
        
        if (swipeCount >= 3){
            [self performSegueWithIdentifier:@"showMatchPage" sender:self];

        }
        
	};
}

- (DRCellSlideActionBlock)pullTriggerBlock {
	return ^(UITableView *tableView, NSIndexPath *indexPath) {
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hooray!" message:@"You just triggered a cell action." preferredStyle:UIAlertControllerStyleAlert];
		[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
			[alertController dismissViewControllerAnimated:YES completion:nil];
		}]];
		
		[self presentViewController:alertController animated:YES completion:nil];
	};
}

@end
