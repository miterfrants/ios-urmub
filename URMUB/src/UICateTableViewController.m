//
//  UICateTableViewController.m
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/14.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import "UICateTableViewController.h"
#import "UICateTableViewCell.h"
#import "Util.h"
#import "VariableStore.h"
#import "UIRootViewController.h"
@interface UICateTableViewController ()

@end

@implementation UICateTableViewController{
            NSMutableArray *arrData;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    //locationManager.delegate=self;
    //locationManager.delegate = self;//or whatever class you have for managing location
    [locationManager startUpdatingLocation];
    [VariableStore sharedInstance].myLocation=locationManager.location;
    arrData= [[NSMutableArray alloc] init];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:1], @"value",
                        @"LBS", @"name",
                        nil
                        ]];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:2], @"value",
                        @"Social Network",@"name",
                        nil
                        ]];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:3], @"value",
                        @"Communication",@"name",
                        nil
                        ]];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:4], @"value",
                        @"Gaming",@"name",
                        nil
                        ]];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:5], @"value",
                        @"Reading",@"name",
                        nil
                        ]];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:6], @"value",
                        @"Music",@"name",
                        nil
                        ]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arrData count];
}

- (UICateTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView registerClass: [UICateTableViewCell class] forCellReuseIdentifier:@"Cell"];
    static NSString *CellIdentifier = @"Cell";
    UICateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[[arrData objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.value=(NSInteger *)[[[arrData objectAtIndex:indexPath.row] objectForKey:@"value"] integerValue];
    // Configure the cell...
    
    return cell;}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VariableStore *vs=[VariableStore sharedInstance];
    UICateTableViewCell *cell=(UICateTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSString *url=[NSString stringWithFormat:@"http://%@/controller/mobile/ur-mub.aspx?action=add&device=%D&cate=%D&sex=%D&lat=%F&lon=%F", [VariableStore sharedInstance].domain,(int) _device,(int) cell.value, (int) _sex,vs.myLocation.coordinate.latitude ,vs.myLocation.coordinate.longitude];

    //NSDictionary *dic=[Util jsonWithUrl:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [Util stringAsyncWithUrl:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeout:3  completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        UIRootViewController *uvcRoot=(UIRootViewController *) vs.uvcRoot;

        if(connectionError!=nil){
            dispatch_async(dispatch_get_main_queue(),^{
                [uvcRoot popUp:@"Request Error" msg:[connectionError description] type:-1 delay:0];
            });

        }else{
            dispatch_async(dispatch_get_main_queue(),^{
                [uvcRoot popUp:@"Request Success" msg:@"send success!" type:0 delay:0];
            });
        }
    } queue:queue];
    //[Util stringAsyncWithUrl:url completion: queue:queue];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
