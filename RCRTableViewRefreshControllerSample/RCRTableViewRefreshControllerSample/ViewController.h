//
//  ViewController.h
//  RCRTableViewRefreshControllerSample
//
//  Created by Rich Robinson on 23/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
