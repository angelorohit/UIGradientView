//
// GradientOverlay.m
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

// Constants for encoding and decoding data.
static NSString * ArchiveKeyForGradientStops = @"gradientstops";

@implementation GradientOverlay
@synthesize gradientStops = _gradientStops;

#pragma mark - NSCoder implementations
- (id) initWithCoder:(NSCoder *)aDecoder {
    NSArray * gradientStops = [aDecoder decodeObjectForKey:ArchiveKeyForGradientStops];
    return [self initWithGradientStops:gradientStops];
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_gradientStops forKey:ArchiveKeyForGradientStops];    
}

#pragma mark - Initializers
- (GradientOverlay *) init {
    return [self initWithGradientStops:nil];
}

- (GradientOverlay *) initWithGradientStops: (NSArray *)gradientStops {
    if (self = [super init]) {
        _gradientStops = gradientStops;
    }
    
    return self;
}

@end
