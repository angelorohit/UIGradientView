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
#import "LinearGradientOverlay.h"
#import "RadialGradientOverlay.h"
#import "GradientStop.h"

@interface UIGradientView()

- (void) drawLinearGradientOverlay: (const LinearGradientOverlay *)linearGradientOverlay withContext:(CGContextRef)currentContext gradient:(CGGradientRef)gradientRef;

- (void) drawRadialGradientOverlay: (const RadialGradientOverlay *)radialGradientOverlay withContext:(CGContextRef)currentContext gradient:(CGGradientRef)gradientRef;

@end

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


- (void) drawLinearGradientOverlay: (const LinearGradientOverlay *)linearGradientOverlay withContext:(CGContextRef)context gradient:(CGGradientRef)gradientRef {
    
    // Calculate the start and end points based on the direction to be rendered.
    CGPoint leftPos, rightPos;
    switch (linearGradientOverlay.direction) {
        case LinearGradientDirection_Vertical:
            leftPos = CGPointMake(CGRectGetMidX(self.bounds), 0.0f);
            rightPos = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
            break;
        case LinearGradientDirection_Horizontal:
            leftPos = CGPointMake(0.0f, CGRectGetMidY(self.bounds));
            rightPos = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds));
            break;
        case LinearGradientDirection_TopLeftToBottomRight:
            leftPos = CGPointMake(0.0f, 0.0f);
            rightPos = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
            break;
        default:
            leftPos = CGPointMake(CGRectGetMaxX(self.bounds), 0.0f);
            rightPos = CGPointMake(0.0f, CGRectGetMaxY(self.bounds));
            break;
    }
    
    CGContextDrawLinearGradient(context, gradientRef, leftPos, rightPos, 0);
}

- (void) drawRadialGradientOverlay: (const RadialGradientOverlay *)radialGradientOverlay withContext:(CGContextRef)context gradient:(CGGradientRef)gradientRef {
    
    const CGPoint pos = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGFloat fillRadius = radialGradientOverlay.radius;
    if (fillRadius == RadialGradientOverlayOptions_FillOuter) {
        fillRadius = sqrtf(self.bounds.size.width * self.bounds.size.width + self.bounds.size.height * self.bounds.size.height) * 0.5f;
    }
    else if (fillRadius == RadialGradientOverlayOptions_FillInner) {
        if (self.bounds.size.height > self.bounds.size.width) {
            fillRadius = self.bounds.size.width * 0.5f;
        }
        else {
            fillRadius = self.bounds.size.height * 0.5f;
        }
    }    
    
    CGContextDrawRadialGradient(context, gradientRef, pos, 0, pos, fillRadius, 0);
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
                
                if ([gradientOverlay isKindOfClass:[LinearGradientOverlay class]]) {
                    
                    LinearGradientOverlay * linearGradientOverlay = (LinearGradientOverlay *) gradientOverlay;
                    [self drawLinearGradientOverlay: linearGradientOverlay withContext:currentContext gradient:gradientRef];
                }
                else if ([gradientOverlay isKindOfClass:[RadialGradientOverlay class]]) {
                    RadialGradientOverlay * radialGradientOverlay = (RadialGradientOverlay *) gradientOverlay;
                    
                    [self drawRadialGradientOverlay: radialGradientOverlay withContext:currentContext gradient:gradientRef];
                }
                
                CGGradientRelease(gradientRef);
                CGColorSpaceRelease(rgbColorSpace);                
            }
        }
    }
}

@end
