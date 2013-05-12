//
//  CMQMasterViewController.h
//  Quotes
//
//  Created by Josh Barrow on 5/12/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@class DetailViewController;

@interface MasterViewController : PFQueryTableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
