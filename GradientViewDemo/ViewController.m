//
//  ViewController.m
//  GradientViewDemo
//
//  Created by Angelo Rohit on 21/07/13.
//  Copyright (c) 2013 Angelo Rohit. All rights reserved.
//

#import "ViewController.h"
#import "UIGradientView+Presets.h"
#import "LinearGradientOverlay.h"
#import "RadialGradientOverlay.h"
#import "GradientStop.h"

@implementation ViewController
@synthesize lblPresetName;

- (void) viewWillAppear:(BOOL)animated {

    // Set custom gradient overlays for the GradientView.
    UIGradientView * gradientView = (UIGradientView *)self.view;
    
    // Add a radial gradient overlay.
    [gradientView addGradientOverlay:[[RadialGradientOverlay alloc] initWithGradientStops:[[NSArray alloc] initWithObjects:
                                                                                           [[GradientStop alloc] initWithColor:[UIColor greenColor] AndOffset:0],
                                                                                           [[GradientStop alloc] initWithColor:[UIColor yellowColor] AndOffset:100],
                                                                                           nil]]];
    
    // Add a linear gradient overlay.
    [gradientView addGradientOverlay:[[LinearGradientOverlay alloc] initWithGradientStops:[[NSArray alloc] initWithObjects:
                                                                                           [[GradientStop alloc] initWithColor:[UIColor colorWithRed:0.117f green:0.341f blue:0.6f alpha:1.0f] AndOffset:0],
                                                                                           [[GradientStop alloc] initWithColor:[UIColor colorWithRed:0.16f green:0.537f blue:0.84f alpha:0.0f] AndOffset:100],
                                                                                           nil]]];
    lblPresetName.text = @"CustomGradientOverlay";
    
    // Save the custom gradient overlay that was set on the gradient view as a
    // new preset to be used later.
    [gradientView addPreset:@"CustomGradientOverlay" toFile:@"Gradient-Presets"];
    
    // Load all presets from file, so that we can cycle through them.
    _presetsDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Gradient-Presets" ofType:@"plist"]];
    if (_presetsDict != nil) {
        _presetKeysArr = [_presetsDict allKeys];
        _presetKeyIndex = 1;
    }
}

- (void) loadNextPreset {
    if (_presetsDict != nil && [_presetKeysArr count] > 0) {
        if (_presetKeyIndex >= [_presetKeysArr count]) {
            _presetKeyIndex = 0;
        }
        
        NSString * key = [_presetKeysArr objectAtIndex:_presetKeyIndex];
        if (key != nil) {
            NSData * data = [_presetsDict objectForKey:key];
            UIGradientView * gradientView = (UIGradientView *)self.view;
            if ([gradientView loadPresetFromData:data]) {
                lblPresetName.text = key;
                [gradientView setNeedsDisplay];
            }
            else {
                NSLog(@"Failed to load preset for key:%@", key);
            }
        }
        
        ++_presetKeyIndex;
    }
}

- (IBAction) handleTapGesture:(UISwipeGestureRecognizer *)sender {
    [self loadNextPreset];
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
