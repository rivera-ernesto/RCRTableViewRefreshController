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
        _refreshHandler = refreshHandler;
        
        // Create a UITableViewController for our internal use, and set its tableView property to point at the tableView passed into this method
        _tableViewController = [[UITableViewController alloc] init];
        _tableViewController.tableView = tableView;
        
        _refreshControl = [[UIRefreshControl alloc] init];
        [_refreshControl addTarget:self action:@selector(doRefresh) forControlEvents:UIControlEventValueChanged];

        _tableViewController.refreshControl = self.refreshControl;
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
