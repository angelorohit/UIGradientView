//
//  ViewController.m
//  GradientViewDemo
//
//  Created by Angelo Rohit on 21/07/13.
//  Copyright (c) 2013 Angelo Rohit. All rights reserved.
//

#import "ViewController.h"
#import "UIGradientView+Presets.h"

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated {
    UIGradientView * gradientView = (UIGradientView *)self.view;
    
    if ([gradientView loadPreset:@"stock-lightgreen" fromFile:@"Gradient-Presets"] == YES) {
        NSLog(@"Successfully loaded preset");
    }
    else {
        NSLog(@"Failed to load preset!");
    }
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
