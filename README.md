RCRTableViewRefreshController
=============================

A simple workaround for using the standard iOS `UIRefreshControl` with a regular `UITableView` without needing a `UITableViewController`.

## What it is

Suppose you have an existing project, with an existing table view, managed by an existing view controller (that's not a subclass of `UITableViewController`). Maybe your view controller is a subclass of a custom view controller that you use throughout your project.

Then suppose a requirement arises: your table view needs to support 'pull to refresh'.

You assume this will be simple enough to do, as iOS provides this functionality out of the box these days. However, you look into it and realize this is only the case if you're using a `UITableViewController`.

Assuming you'd prefer not to rewrite your code and possibly break your view controller inheritance hierarchy, then `RCRTableViewRefreshController` is one quick and easy workaround for your problem, and you'll be up and running with the standard iOS `UIRefreshControl` on your table view in no time.

## What it Depends on

`RCRTableViewRefreshController` depends on Xcode 5 and higher (although note that the sample project is designed for Xcode 6 and will need modifying to work with Xcode 5).

## How to Use it

First, add the `RCRTableViewRefreshController` folder and code to your project.

Then, one way to use the refresh controller would be as follows.

Add a property for the refresh controller to your table's associated view controller:

```objc
@property (nonatomic, strong) RCRTableViewRefreshController *refreshController;
```

Then, in your `viewDidLoad` method, initialize the refresh controller, passing it a reference to your table view, and a block of code to call when the user pulls to refresh. For example:

```objc
// Setup our refresh controller, with our table view and some code to perform when the user pulls down
self.refreshController = [[RCRTableViewRefreshController alloc] initWithTableView:self.tableView refreshHandler:^{
    // Act on the request to refresh the table view
    // (Insert your data refreshing logic here)
}];
```

Finally, when you're done refreshing data (this may occur via a callback of some kind), tell the controller to end refreshing:

```objc
    [self.refreshController endRefreshing];
```
    
You may also want to reload the table data at this point, if you haven't already taken measures to do this. Assuming you have a property named `tableView`:

```objc
    [self.tableView reloadData];
```

## Sample Project

A sample project demonstrating a working example of the refresh controller can be found in the `RCRTableViewRefreshControllerSample` folder.

## License

MIT License (see `LICENSE` in the root of the repository).