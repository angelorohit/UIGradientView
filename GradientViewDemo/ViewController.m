//
//  ViewController.m
//  GradientViewDemo
//
//  Created by Angelo Rohit on 21/07/13.
//  Copyright (c) 2013 Angelo Rohit. All rights reserved.
//

#import "ViewController.h"
#import "UIGradientView.h"
#import "GradientOverlay.h"
#import "GradientStop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated {
    UIGradientView * gradientView = (UIGradientView *)self.view;
    
    // Add two gradient overlays to be rendered.
    
    // First overlay is a gradient from green to yellow.
    [gradientView addGradientOverlay:[[GradientOverlay alloc] initWithGradientStops:[[NSArray alloc] initWithObjects:
                                                                                     [[GradientStop alloc] initWithColor:[UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:0.5f] AndOffset:0],
                                                                                     [[GradientStop alloc] initWithColor:[UIColor colorWithRed:1.0f green:1.0f blue:0.0f alpha:1.0f] AndOffset:100],
                                                                                     nil]]];
    
    // Second overlay is a gradient from blue to transparent.
    [gradientView addGradientOverlay:[[GradientOverlay alloc] initWithGradientStops:[[NSArray alloc] initWithObjects:
                                                                                     [[GradientStop alloc] initWithColor:[UIColor colorWithRed:0.117f green:0.341f blue:0.6f alpha:1.0f] AndOffset:0],
                                                                                     [[GradientStop alloc] initWithColor:[UIColor colorWithRed:0.16f green:0.537f blue:0.84f alpha:0.0f] AndOffset:100],
                                                                                     nil]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
