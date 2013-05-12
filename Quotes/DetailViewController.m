//
//  CMQDetailViewController.m
//  Quotes
//
//  Created by Josh Barrow on 5/12/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }     
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if ([self detailItem]) {
        [[self detailDescriptionLabel] setText:[[self detailItem] objectForKey:@"quoteText"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
