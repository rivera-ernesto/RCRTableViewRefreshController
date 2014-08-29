//
//  ViewController.h
//  RCRTableViewRefreshControllerSample
//
//  Created by Rich Robinson on 23/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

// Note that this view controller is not a subclass of UITableViewController, which you would generally need it to be in order to use a UIRefreshControl with the table view. RCRTableViewRefreshController allows us to work around this and use a regular UIViewcontroller (or any subclass of UIViewcontroller)
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@end
