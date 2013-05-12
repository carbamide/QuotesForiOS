//
//  CMQAddQuoteViewController.m
//  Quotes
//
//  Created by Josh Barrow on 5/12/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "AddQuoteViewController.h"
#import <Parse/Parse.h>

@interface AddQuoteViewController ()

@property (nonatomic, strong) IBOutlet UITextField *attribution;
@property (nonatomic, strong) IBOutlet UITextView *quoteText;

@end

@implementation AddQuoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)save:(id)sender {
    PFObject *quote = [PFObject objectWithClassName:@"Quote"];
    [quote setObject:[[self attribution] text] forKey:@"by"];
    [quote setObject:[[self quoteText] text] forKey:@"quoteText"];
    
    [quote saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self done:self];
        }
    }];
}

@end
