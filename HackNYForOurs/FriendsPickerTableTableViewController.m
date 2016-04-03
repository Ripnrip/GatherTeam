//
//  FriendsPickerTableTableViewController.m
//  HackNYForOurs
//
//  Created by Admin on 4/2/16.
//  Copyright (c) 2016 Binary Bros. All rights reserved.
//

#import "FriendsPickerTableTableViewController.h"
#import "Foursquare2.h"
#import "TableViewController.h"
NSString const *foursquareClientKey = @"D1J2JPJHUMC3URJSZDZOOYSFX0VOBN4KSFDTKBOYF01U540D";
NSString const *foursquareClientSecret = @"BM2HIPBJH5XWTTX3CUVJJ0ZZUHGBXV5Y2254SNSBYCE1WYGQ";
@interface FriendsPickerTableTableViewController ()
@property (nonatomic,strong)  NSIndexPath* lastIndexPath;
@property (nonatomic,strong) NSMutableArray* selectedFriends;

@property (nonatomic, strong) NSMutableArray *allVenues; // of restaurants
@property (nonatomic,strong)NSData*connectionData;


@end

@implementation FriendsPickerTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self getData];
}


-(void)getData{
    if (!self.connectionData) {
        self.connectionData = [[NSMutableData alloc] init];
    }
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        
        dispatch_sync(concurrentQueue, ^{
            
            NSString *urlAsString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=40.728668,-73.995659&limit=5&query=coffee&client_id=%@&client_secret=%@&v=%@",foursquareClientKey,foursquareClientSecret,@"20160402"];
            NSURL *url=[NSURL URLWithString:urlAsString];
            
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                        cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0F];
            NSOperationQueue *queue = [[NSOperationQueue alloc] init];
            [NSURLConnection sendAsynchronousRequest:urlRequest queue: queue
                                   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                                       if ([data length]>0 && connectionError == nil) {
                                           // [self.connectionData appendData:data];
                                           
                                           // NSLog(@"datalength is %ld", [self.connectionData length]);
                                           NSString *retString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                           // NSLog(@"json returned: %@ <end>", retString);
                                           
                                           NSError* error;
                                           NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                options:kNilOptions
                                                                                                  error:&error];
                                           
                                           NSArray* venues = [json objectForKey:@"response"][@"venues"];
                                           self.allVenues=[[NSMutableArray alloc]initWithArray:venues];
                                           
                                           NSLog(@"venues: %@", self.allVenues);
                                           
                                           
                                           
                                       }
                                       
                                       else if ([data length]==0 && connectionError ==nil)
                                       {NSLog(@"Nothing was downloaded!");
                                       }
                                       else if (connectionError != nil){
                                           NSLog(@"Error happend = %@", connectionError);
                                       }
                                   }];
            
        });
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    
    // Configure the cell...

    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    //return UIView
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section{
    UIView*footerView=[[UIView alloc]init];
    [footerView setBackgroundColor:[UIColor colorWithRed:154.0/255.0 green:151.0/255.0 blue:182.0/255.0 alpha:1.0]];
    
    UIButton*goButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 15, 320, 50)];
    [goButton setTitle:@"Ready" forState:UIControlStateNormal];
    [goButton addTarget:self action:@selector(ready) forControlEvents:UIControlEventTouchUpInside];
    
    
    [footerView addSubview:goButton];
    
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return 80;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showLocationPicker"])
    {
        // Get reference to the destination view controller
        TableViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setVenues:self.allVenues];
        
        
    }
}

-(void)ready{
    [self performSegueWithIdentifier:@"showLocationPicker" sender:self];

    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
