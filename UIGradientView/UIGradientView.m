//
// UIGradientView.m
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

#import "UIGradientView.h"
#import "GradientOverlay.h"
#import "GradientStop.h"

@implementation UIGradientView

- (void) addGradientOverlay: (GradientOverlay *) gradientOverlay {
    if (_gradientOverlays == nil) {
        _gradientOverlays = [[NSMutableArray alloc] init];
    }
    
    [_gradientOverlays addObject:gradientOverlay];
}

- (void) clearGradientOverlays {
    if (_gradientOverlays != nil) {
        [_gradientOverlays removeAllObjects];
    }
}

#pragma mark View Overrides
- (void)drawRect:(CGRect)rect
{
    if (_gradientOverlays != nil) {
        for (GradientOverlay * gradientOverlay in _gradientOverlays) {
            const NSArray * const gradientStops = gradientOverlay.gradientStops;
            if (gradientStops != nil) {
                const NSUInteger noOfLocations = [gradientStops count];
                CGFloat locations[noOfLocations];
                CGFloat components[noOfLocations * 4];
                
                for (NSUInteger i = 0; i < noOfLocations; ++i) {
                    const GradientStop * const gradientStop =
                                                        (GradientStop *)[gradientStops objectAtIndex:i];
                    locations[i] = gradientStop.offset * 0.01f;
                    
                    const CGFloat * colorComponents = CGColorGetComponents(gradientStop.color.CGColor);
                    
                    components[i * 4] = colorComponents[0];
                    components[i * 4 + 1] = colorComponents[1];
                    components[i * 4 + 2] = colorComponents[2];
                    components[i * 4 + 3] = colorComponents[3];
                }
                
                CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
                CGGradientRef gradientRef = CGGradientCreateWithColorComponents(rgbColorSpace, components, locations, noOfLocations);
                
                CGContextRef currentContext = UIGraphicsGetCurrentContext();
                
                const CGRect currentBounds = self.bounds;
                
                CGPoint leftPos, rightPos;
                
                // Calculate the start and end points based on the direction to be rendered.
                switch (gradientOverlay.gradientDirection) {
                    case GradientDirection_Vertical:
                        leftPos = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
                        rightPos = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMaxY(currentBounds));
                        break;
                    case GradientDirection_Horizontal:
                        leftPos = CGPointMake(0.0f, CGRectGetMidY(currentBounds));
                        rightPos = CGPointMake(CGRectGetMaxX(currentBounds), CGRectGetMidY(currentBounds));
                        break;
                    case GradientDirection_TopLeftToBottomRight:
                        leftPos = CGPointMake(0.0f, 0.0f);
                        rightPos = CGPointMake(CGRectGetMaxX(currentBounds), CGRectGetMaxY(currentBounds));
                        break;
                    default:
                        leftPos = CGPointMake(CGRectGetMaxX(currentBounds), 0.0f);
                        rightPos = CGPointMake(0.0f, CGRectGetMaxY(currentBounds));
                        break;
                }
                
                CGContextDrawLinearGradient(currentContext, gradientRef, leftPos, rightPos, 0);
                
                CGGradientRelease(gradientRef);
                CGColorSpaceRelease(rgbColorSpace);
            }
        }
    }
}

@end
