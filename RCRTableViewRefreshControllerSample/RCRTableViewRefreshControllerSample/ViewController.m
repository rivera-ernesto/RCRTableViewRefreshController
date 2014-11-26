//
//  ViewController.m
//  RCRRefreshControlSample
//
//  Created by Rich Robinson on 23/08/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "ViewController.h"

#import "RCRRefreshControl.h"

NSString *const TableViewCellReuseIdentifier = @"TableViewCellReuseIdentifier";


@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *data;

// Here's our refresh controller
@property (nonatomic, strong) RCRRefreshControl *refreshController;

@end


@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup our initial data to display in the table
    self.data = [NSMutableArray arrayWithArray:@[@"Apple", @"Banana", @"Grapefruit", @"Lemon", @"Lime", @"Mango", @"Orange", @"Passionfruit", @"Peach", @"Watermelon"]];
    
    // Register our table view cell class
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellReuseIdentifier];
    
    // Setup our refresh controller, with our table view and some code to perform when the user pulls down
    self.refreshController = [[RCRRefreshControl alloc] initWithTableView:self.tableView refreshHandler:^{
        // Act on the request to refresh the table view
        [self refreshData];
    }];
}

#pragma mark - Data refreshing

- (void)refreshData {
    // For this sample project we simply shuffle the contents of our data array in order to get a change in data (in practice this refresh could come in any form - calling a web service for updated data, for example)
    
    NSUInteger count = self.data.count;

    for (int i = 0; i < count; i++) {
        int randomInt1 = arc4random() % count;
        int randomInt2 = arc4random() % count;
        [self.data exchangeObjectAtIndex:randomInt1 withObjectAtIndex:randomInt2];
    }
    
    // In practice, the following method may be executed via a callback - upon receiving web service data, for example
    [self dataHasRefreshed];
}

- (void)dataHasRefreshed {
    // Ensure we're on the main queue as we'll be updating the UI (not strictly necessary for this example, but will likely be essential in less trivial scenarios and so is included for illustrative purposes)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // At some point later, when we're done getting our new data, tell our refresh controller to end refreshing
        [self.refreshController endRefreshing];
        
        // Finally get the table view to reload its data
        [self.tableView reloadData];
    });
}

#pragma mark - UITableViewDataSource and UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellReuseIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

@end
