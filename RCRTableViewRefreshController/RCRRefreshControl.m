//
//  RCRRefreshControl.m
//
//  Created by Rich Robinson on 02/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRRefreshControl.h"

@implementation RCRRefreshControl

- (void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    
    // In order to use a UIRefreshControl on a the supplied table view we can use a UITableViewController behind the scenes to wire up the refresh control and table view, and get them working together. The table view controller is never actually presented - it's purely used as a workaround for adding the refresh control to the table view
    
    // First, create a UITableViewController for our internal use and set its tableView property to point at the table view passed into this method
    UITableViewController * tableViewController = [UITableViewController new];
    tableViewController.tableView = tableView;
    tableViewController.refreshControl = self;
}

@end

