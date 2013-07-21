//
// GradientOverlay.h
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

#import <Foundation/Foundation.h>

// The directions in which linear gradients can appear.
typedef NS_ENUM(NSUInteger, GradientDirection) {
    GradientDirection_Vertical,
    GradientDirection_Horizontal,
    GradientDirection_TopLeftToBottomRight,
    GradientDirection_TopRightToBottomLeft
};

// GradientOverlay is a class that represents
// the overlay of a Gradient in a UIGradientView.
// There can be multiple overlays in a UIGradientView.
// Each overlay specifies the GradientStops to be overlayed
// as well the direction in which the gradient is to
// be rendered.
@interface GradientOverlay : NSObject    

@property (nonatomic, strong) NSArray * gradientStops;
@property (nonatomic) GradientDirection gradientDirection;

- (GradientOverlay *) initWithGradientStops: (NSArray *) gradientStops;

@end
