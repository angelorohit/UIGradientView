//
//  ViewController.h
//  GradientViewDemo
//
//  Created by Angelo Rohit on 21/07/13.
//  Copyright (c) 2013 Angelo Rohit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIGradientView;
@interface ViewController : UIViewController {
    // Private members used to cycle through the
    // preset keys.
    @private
    NSDictionary * _presetsDict;
    NSArray * _presetKeysArr;
    NSUInteger _presetKeyIndex;
}

// A label that displays the name of the Gradient preset that is loaded.
@property (nonatomic, strong) IBOutlet UILabel * lblPresetName;

- (IBAction) handleTapGesture:(UISwipeGestureRecognizer *)sender;

@end
