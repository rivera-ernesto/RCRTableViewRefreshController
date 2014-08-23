//
//  RCRTableViewRefreshController.m
//
//  Created by Rich Robinson on 02/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRTableViewRefreshController.h"

@interface RCRTableViewRefreshController ()

@property (nonatomic, copy) void (^refreshHandler) ();
@property (nonatomic, strong) UITableViewController *tableViewController;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end


@implementation RCRTableViewRefreshController

- (instancetype)initWithTableView:(UITableView *)tableView refreshHandler:(void (^) ())refreshHandler {
    self = [super init];
    
    if (self) {
        self.refreshHandler = refreshHandler;
        
        // Create a UITableViewController for our internal use, and set its tableView property to point at the tableView passed into this method
        self.tableViewController = [[UITableViewController alloc] init];
        self.tableViewController.tableView = tableView;
        
        self.refreshControl = [[UIRefreshControl alloc] init];
        [self.refreshControl addTarget:self action:@selector(doRefresh) forControlEvents:UIControlEventValueChanged];

        self.tableViewController.refreshControl = self.refreshControl;
    }
    
    return self;
}

- (void)doRefresh {
    if (self.refreshHandler) {
        self.refreshHandler();
    }
}

- (void)endRefreshing {
    [self.refreshControl endRefreshing];
}

@end
