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

@property (strong, nonatomic) IBOutlet UITextField *attribution;
@property (strong, nonatomic) IBOutlet UITextView *quoteText;
@property (strong, nonatomic) IBOutlet UITextField *source;

@end

@implementation AddQuoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[[self quoteText] layer] setCornerRadius:8];
    [[[self quoteText] layer] setBorderColor:[[UIColor darkGrayColor] CGColor]];
    [[[self quoteText] layer] setBorderWidth:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)save:(id)sender
{
    PFObject *quote = [PFObject objectWithClassName:@"Quote"];
    
    [quote setObject:[[self attribution] text] forKey:@"by"];
    [quote setObject:[[self quoteText] text] forKey:@"quoteText"];
    [quote setObject:[[self source] text] forKey:@"sourceText"];
    [quote setObject:[PFUser currentUser] forKey:@"user"];
    
    [quote saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self done:self];
        }
    }];
}

@end
