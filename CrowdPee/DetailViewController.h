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

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
