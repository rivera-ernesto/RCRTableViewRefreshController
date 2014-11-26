//
//  RCRRefreshControl.h
//
//  Created by Rich Robinson on 02/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 A simple workaround for using the standard iOS <tt>UIRefreshControl</tt> with a regular <tt>UITableView</tt> without needing a <tt>UITableViewController</tt>.

 For the record, this is a non-ideal way of adding a refresh control to a table view. The proper, correct way to do it is by using a <tt>UITableViewController</tt> class rather than working with a <tt>UITableView</tt> directly. However, this is not always practical - particularly when adding a refresh control to an existing table view, with an existing class hierarchy.
 */
@interface RCRRefreshControl : UIRefreshControl

/**
 The corresponding table view.
 
 @param tableView The <tt>UITableView</tt> to be augmented with a UIRefreshControl.
 */

@property (nonatomic, weak) IBOutlet UITableView * tableView;

@end

