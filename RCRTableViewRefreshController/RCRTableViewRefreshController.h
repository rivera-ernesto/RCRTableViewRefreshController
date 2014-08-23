//
//  RCRTableViewRefreshController.h
//
//  Created by Rich Robinson on 02/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

/// This is a non-ideal way of adding a refresh control to a table view. The proper, correct way to do it is by using a UITableViewController class rather than working with a UITableView directly. However, this is not always practical -particularly when adding a refresh control to an already existing table view, with an existing class hierarchy, and working to a time limit!

@interface RCRTableViewRefreshController : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView refreshHandler:(void (^) ())refreshHandler NS_DESIGNATED_INITIALIZER;

- (void)endRefreshing;

@end
