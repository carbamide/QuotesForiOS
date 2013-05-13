//
//  CMQDetailViewController.m
//  Quotes
//
//  Created by Josh Barrow on 5/12/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "DetailViewController.h"
#import <Parse/Parse.h>

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
    NSLog(@"%@", _detailItem);
    
    if ([self detailItem]) {
        [[self detailDescriptionLabel] setText:[[self detailItem] objectForKey:@"quoteText"]];
        [[self nameLabel] setText:[[self detailItem] objectForKey:@"by"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor underPageBackgroundColor]];
    
    [[self detailDescriptionLabel] setBackgroundColor:[UIColor clearColor]];
    
    [[[self detailDescriptionLabel] layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[[self detailDescriptionLabel] layer] setShadowOffset:CGSizeMake(0, 0)];
    [[[self detailDescriptionLabel] layer] setShadowOpacity:0.8];
    [[[self detailDescriptionLabel] layer] setShadowRadius:5];
    
    [[[self nameLabel] layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[[self nameLabel] layer] setShadowOffset:CGSizeMake(0, 0)];
    [[[self nameLabel] layer] setShadowOpacity:0.8];
    [[[self nameLabel] layer] setShadowRadius:5];
    
    [[[self timestamp] layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[[self timestamp] layer] setShadowOffset:CGSizeMake(0, 0)];
    [[[self timestamp] layer] setShadowOpacity:0.8];
    [[[self timestamp] layer] setShadowRadius:5];
    
    [self configureView];
    
    [[self navigationController] setToolbarHidden:NO animated:YES];
    
    [self setToolbarItems:@[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(performAction:)]]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[self navigationController] setToolbarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)performAction:(UIBarButtonItem *)sender
{
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[[[self detailDescriptionLabel] text], [[self nameLabel] text]] applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
}
@end
