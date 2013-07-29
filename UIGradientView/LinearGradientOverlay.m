//
// LinearGradientOverlay.m
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

#import "LinearGradientOverlay.h"

// Constants for encoding and decoding data.
static NSString * ArchiveKeyForDirection = @"direction";

@implementation LinearGradientOverlay
@synthesize direction = _direction;

#pragma mark - NSCoder implementations
- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.direction = [aDecoder decodeIntForKey:ArchiveKeyForDirection];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeInt:_direction forKey:ArchiveKeyForDirection];
}

#pragma mark - Initializers
- (LinearGradientOverlay *) init {
    return [self initWithGradientStops:nil];
}

- (LinearGradientOverlay *) initWithGradientStops: (NSArray *)gradientStops {
    return [self initWithGradientStops:gradientStops AndDirection:LinearGradientDirection_Vertical];
}

- (LinearGradientOverlay *) initWithGradientStops: (NSArray *)gradientStops AndDirection:(LinearGradientDirection)direction {
    if (self = [super initWithGradientStops:gradientStops]) {
        self.direction = direction;
    }
    
    return self;
}

#pragma mark - Getters / Setters
- (void) setDirection:(LinearGradientDirection)direction {
    if (direction >= LinearGradientDirection_Max) {
        _direction = LinearGradientDirection_Vertical;
    }
    else {
        _direction = direction;
    }
}

@end
