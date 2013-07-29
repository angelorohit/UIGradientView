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
#import "RadialGradientOverlay.h"

// Constants for encoding and decoding data.
static NSString * ArchiveKeyForRadius = @"radius";

@implementation RadialGradientOverlay
@synthesize radius = _radius;

#pragma mark - NSCoder implementations
- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.radius = [aDecoder decodeIntForKey:ArchiveKeyForRadius];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeInt:_radius forKey:ArchiveKeyForRadius];
}

#pragma mark - Initializers
- (RadialGradientOverlay *) init {
    return [self initWithGradientStops:nil];
}

- (RadialGradientOverlay *) initWithGradientStops: (NSArray *)gradientStops {
    return [self initWithGradientStops:gradientStops AndRadius:RadialGradientOverlayOptions_FillOuter];
}

- (RadialGradientOverlay *) initWithGradientStops: (NSArray *)gradientStops AndRadius:(NSInteger)radius {
    if (self = [super initWithGradientStops:gradientStops]) {
        self.radius = radius;
    }
    
    return self;
}

#pragma mark - Getters / Setters
- (void) setRadius:(NSInteger)radius {
    if (radius <= RadialGradientOverlayOptions_Max) {
        _radius = RadialGradientOverlayOptions_FillOuter;
    }
    else {
        _radius = radius;
    }
}

@end
