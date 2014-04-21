//
//  DetailViewController.m
//  CrowdPee
//
//  Created by Zarkonnen on 3/23/14.
//  Copyright (c) 2014 Rachel Knowler & David Stark. All rights reserved.
//

#import "DetailViewController.h"
#import "CPLocation.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;

- (IBAction)toiletsUnisexClick:(id)sender;
- (IBAction)toiletsGenderedClick:(id)sender;
- (IBAction)toiletsDontKnowClick:(id)sender;
- (IBAction)wheelchairYesClick:(id)sender;
- (IBAction)wheelchairNoClick:(id)sender;
- (IBAction)wheelchairDontKnowClick:(id)sender;
- (IBAction)babyEveryoneClick:(id)sender;
- (IBAction)babyWomenClick:(id)sender;
- (IBAction)babyNoClick:(id)sender;
- (IBAction)babyDontKnowClick:(id)sender;


@end

@implementation DetailViewController

- (IBAction)toiletsUnisexClick:(id)sender {
    self.toiletsValue = 1;
    [self checkQuestionnaireState];
}
- (IBAction)toiletsGenderedClick:(id)sender {
    self.toiletsValue = 2;
    [self checkQuestionnaireState];
}
- (IBAction)toiletsDontKnowClick:(id)sender {
    self.toiletsValue = 3;
    [self checkQuestionnaireState];
}
- (IBAction)wheelchairYesClick:(id)sender {
    self.wheelchairValue = 4;
    [self checkQuestionnaireState];
}
- (IBAction)wheelchairNoClick:(id)sender {
    self.wheelchairValue = 5;
    [self checkQuestionnaireState];
}
- (IBAction)wheelchairDontKnowClick:(id)sender {
    self.wheelchairValue = 6;
    [self checkQuestionnaireState];
}
- (IBAction)babyEveryoneClick:(id)sender {
    self.babyValue = 7;
    [self checkQuestionnaireState];
}
- (IBAction)babyWomenClick:(id)sender {
    self.babyValue = 8;
    [self checkQuestionnaireState];
}
- (IBAction)babyNoClick:(id)sender {
    self.babyValue = 9;
    [self checkQuestionnaireState];
}
- (IBAction)babyDontKnowClick:(id)sender {
    self.babyValue = 10;
    [self checkQuestionnaireState];
}

- (void)checkQuestionnaireState {
    if (self.toiletsValue == 1) {
        self.toiletsUnisex.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.toiletsUnisex.backgroundColor = nil;
    }
    if (self.toiletsValue == 2) {
        self.toiletsGendered.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.toiletsGendered.backgroundColor = nil;
    }
    if (self.toiletsValue == 3) {
        self.toiletsDontKnow.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.toiletsDontKnow.backgroundColor = nil;
    }
    
    if (self.wheelchairValue == 4) {
        self.wheelchairYes.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.wheelchairYes.backgroundColor = nil;
    }
    if (self.wheelchairValue == 5) {
        self.wheelchairNo.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.wheelchairNo.backgroundColor = nil;
    }
    if (self.wheelchairValue == 6) {
        self.wheelchairDontKnow.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.wheelchairDontKnow.backgroundColor = nil;
    }
    
    if (self.babyValue == 7) {
        self.babyEveryone.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.babyEveryone.backgroundColor = nil;
    }
    if (self.babyValue == 8) {
        self.babyWomen.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.babyWomen.backgroundColor = nil;
    }
    if (self.babyValue == 9) {
        self.babyNo.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.babyNo.backgroundColor = nil;
    }
    if (self.babyValue == 10) {
        self.babyDontKnow.backgroundColor = [UIColor colorWithRed:0.6 green:1.0 blue:0.6 alpha:1.0];
    } else {
        self.babyDontKnow.backgroundColor = nil;
    }
    
    if (self.toiletsValue != -1 && self.wheelchairValue != -1 && self.babyValue != -1) {
        self.toiletsQ.hidden = true;
        self.toiletsUnisex.hidden = true;
        self.toiletsGendered.hidden = true;
        self.toiletsDontKnow.hidden = true;
        
        self.wheelchairQ.hidden = true;
        self.wheelchairYes.hidden = true;
        self.wheelchairNo.hidden = true;
        self.wheelchairDontKnow.hidden = true;
        
        self.babyQ.hidden = true;
        self.babyEveryone.hidden = true;
        self.babyWomen.hidden = true;
        self.babyNo.hidden = true;
        self.babyDontKnow.hidden = true;
        
        self.submitSpinner.hidden = false;
        self.submitLabel.hidden = false;
        [self.submitSpinner startAnimating];
        
        NSArray *answerList = @[
                                @{@"question": @1, @"option": [NSNumber numberWithInt: self.toiletsValue]},
                                @{@"question": @2, @"option": [NSNumber numberWithInt: self.wheelchairValue]},
                                @{@"question": @3, @"option": [NSNumber numberWithInt: self.babyValue]}
        ];
        NSDictionary *postData = @{@"answers": answerList};
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postData options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        jsonString = [NSString stringWithFormat:@"data=%@", jsonString];
        NSLog(@"JSON Output: %@", jsonString);
        jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://nearbysources.com/q/1/%d/en/submit_response", ((CPLocation *) self.detailItem).id]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        //[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        //[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%d", [jsonData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: jsonData];
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.submitSpinner stopAnimating];
    self.submitLabel.text = @"Thanks!";
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.questionnaireNavigationItem.title = ((CPLocation *) self.detailItem).name;
    }
    self.toiletsValue = -1;
    self.wheelchairValue = -1;
    self.babyValue = -1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
