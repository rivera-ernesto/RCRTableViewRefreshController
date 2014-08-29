Pod::Spec.new do |s|
  s.name             = "RCRTableViewRefreshController"
  s.version          = "1.0.2"
  s.summary          = "A simple workaround for using the standard iOS UIRefreshControl with a regular UITableView without needing a UITableViewController."
  s.homepage         = "https://github.com/robinsonrc/RCRTableViewRefreshController"
  s.license          = { :type => 'MIT', :file => 'LICENSE'  }
  s.author           = "Rich Robinson"
  s.source           = { :git => "https://github.com/robinsonrc/RCRTableViewRefreshController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = ['RCRTableViewRefreshController/*.{h,m}']

  s.frameworks = 'UIKit'
end
