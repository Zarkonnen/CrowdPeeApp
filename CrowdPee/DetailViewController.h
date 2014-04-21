//
//  DetailViewController.h
//  CrowdPee
//
//  Created by Zarkonnen on 3/23/14.
//  Copyright (c) 2014 Rachel Knowler & David Stark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;


@property (weak, nonatomic) IBOutlet UILabel *toiletsQ;
@property (weak, nonatomic) IBOutlet UIButton *toiletsUnisex;
@property (weak, nonatomic) IBOutlet UIButton *toiletsGendered;
@property (weak, nonatomic) IBOutlet UIButton *toiletsDontKnow;

@property (weak, nonatomic) IBOutlet UILabel *wheelchairQ;
@property (weak, nonatomic) IBOutlet UIButton *wheelchairYes;
@property (weak, nonatomic) IBOutlet UIButton *wheelchairNo;
@property (weak, nonatomic) IBOutlet UIButton *wheelchairDontKnow;


@property (weak, nonatomic) IBOutlet UILabel *babyQ;
@property (weak, nonatomic) IBOutlet UIButton *babyEveryone;
@property (weak, nonatomic) IBOutlet UIButton *babyWomen;
@property (weak, nonatomic) IBOutlet UIButton *babyNo;
@property (weak, nonatomic) IBOutlet UIButton *babyDontKnow;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *submitSpinner;
@property (weak, nonatomic) IBOutlet UILabel *submitLabel;


@property int toiletsValue;
@property int wheelchairValue;
@property int babyValue;

@property (weak, nonatomic) IBOutlet UINavigationItem *questionnaireNavigationItem;
@end
