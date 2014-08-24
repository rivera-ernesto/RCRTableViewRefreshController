//
//  RCRTableViewRefreshController.h
//
//  Created by Rich Robinson on 02/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 A simple workaround for using the standard iOS @c UIRefreshControl with a regular @c UITableView without needing a @c UITableViewController.

 For the record, this is a non-ideal way of adding a refresh control to a table view. The proper, correct way to do it is by using a @c UITableViewController class rather than working with a @c UITableView directly. However, this is not always practical - particularly when adding a refresh control to an existing table view, with an existing class hierarchy.
 */
@interface RCRTableViewRefreshController : NSObject

/**
 Designated initializer.
 
 @param tableView The @c UITableView to be augmented with a <tt>UIRefreshControl</tt>.
 @param refreshHandler A block to be executed when the refresh control is activated.
 */
- (instancetype)initWithTableView:(UITableView *)tableView refreshHandler:(void (^) ())refreshHandler /*NS_DESIGNATED_INITIALIZER*/;

/**
 Tell the refresh control that the refresh operation has ended.
 */
- (void)endRefreshing;

@end
