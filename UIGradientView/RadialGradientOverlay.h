//
// RadialGradientOverlay.h
//
// Copyright (c) 2013 Angelo Rohit Joseph Pulikotil
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "GradientOverlay.h"

typedef enum {
    // The rendered radial gradient will completely fill
    // the UIGRadientView
    RadialGradientOverlayOptions_FillOuter = -1,
    
    // The rendered radial gradient will fit the inside
    // of the UIGradientView.
    RadialGradientOverlayOptions_FillInner = -2,
    
    RadialGradientOverlayOptions_Max = -3
} RadialGradientOverlayOptions;

// RadialGradientOverlay is a subclass of GradientOverlay.
// It can be used to render radial gradients in a UIGradientView.
@interface RadialGradientOverlay : GradientOverlay

// The radius of the radial gradient.
@property (nonatomic) NSInteger radius;

// Initializes this class with the given gradient stops and a default radius.
- (RadialGradientOverlay *) initWithGradientStops: (NSArray *)gradientStops;

// Initializes this class with the given gradient stops and radius.
- (RadialGradientOverlay *) initWithGradientStops: (NSArray *)gradientStops AndRadius:(NSInteger)radius;

@end
