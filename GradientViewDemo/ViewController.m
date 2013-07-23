//
//  ViewController.m
//  GradientViewDemo
//
//  Created by Angelo Rohit on 21/07/13.
//  Copyright (c) 2013 Angelo Rohit. All rights reserved.
//

#import "ViewController.h"
#import "UIGradientView.h"
#import "LinearGradientOverlay.h"
#import "RadialGradientOverlay.h"
#import "GradientStop.h"

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated {
    UIGradientView * gradientView = (UIGradientView *)self.view;
    
    // Add two gradient overlays to be rendered.
    
    // First overlay is a radial gradient from Green to Yellow.
    [gradientView addGradientOverlay:[[RadialGradientOverlay alloc] initWithGradientStops:[[NSArray alloc] initWithObjects:
                                                                                           [[GradientStop alloc] initWithColor:[UIColor greenColor] AndOffset:0],
                                                                                           [[GradientStop alloc] initWithColor:[UIColor yellowColor] AndOffset:100],
                                                                                           nil]]];
    
    // Second overlay is a linear gradient from blue to transparent.
    [gradientView addGradientOverlay:[[LinearGradientOverlay alloc] initWithGradientStops:[[NSArray alloc] initWithObjects:
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
