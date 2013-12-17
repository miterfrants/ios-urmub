//
//  UIDeviceTableViewController.m
//  URMUB
//
//  Created by Po-Hsiang Hunag on 2013/12/13.
//  Copyright (c) 2013年 Po-Hsiang Hunag. All rights reserved.
//

#import "UIDeviceTableViewController.h"
#import "UIDeviceTableViewCell.h"
#import "UISexTableViewController.h"
@interface UIDeviceTableViewController ()

@end

@implementation UIDeviceTableViewController{
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
    arrData= [[NSMutableArray alloc] init];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:1], @"value",
                        @"iOS", @"name",
                        nil
                        ]];
    [arrData addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:2], @"value",
                        @"Android",@"name",
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

- (UIDeviceTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView registerClass: [UIDeviceTableViewCell class] forCellReuseIdentifier:@"Cell"];
    static NSString *CellIdentifier = @"Cell";
    UIDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[[arrData objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.value=(NSInteger *)[[[arrData objectAtIndex:indexPath.row] objectForKey:@"value"] integerValue];
    
    // Configure the cell...

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *nv=(UINavigationController *) self.navigationController;
    UISexTableViewController *uvc= [[UISexTableViewController alloc] init];
    UIDeviceTableViewCell *cell=(UIDeviceTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    uvc.device=cell.value;
    [nv topViewController].title=cell.textLabel.text;
    [nv pushViewController:uvc animated:true];
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
