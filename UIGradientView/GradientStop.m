//
// GradientStop.m
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

#import "GradientStop.h"

// Constants for encoding and decoding data.
static NSString * ArchiveKeyForColor = @"color";
static NSString * ArchiveKeyForOffset = @"offset";

@implementation GradientStop
@synthesize color = _color, offset = _offset;

#pragma mark - NSCoder implementations
- (id) initWithCoder:(NSCoder *)aDecoder {
    UIColor * color = [aDecoder decodeObjectForKey:ArchiveKeyForColor];
    NSUInteger offset = [aDecoder decodeIntForKey:ArchiveKeyForOffset];
    
    return [self initWithColor:color AndOffset:offset];
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_color forKey:ArchiveKeyForColor];    
    [aCoder encodeInt:_offset forKey:ArchiveKeyForOffset];
}

#pragma mark - Initializers
- (GradientStop *) initWithColor: (UIColor *)color AndOffset:(NSUInteger)offset {
    if (self = [super init]) {
        self.color = color;
        self.offset = offset;        
    }
    
    return self;
}

- (GradientStop *) init {
    return [self initWithColor:nil AndOffset:0];
}

#pragma mark - Getters / Setters
- (void) setColor:(UIColor *)color {
    if (color == nil) {
        _color = [UIColor blackColor];
    }
    else {
        _color = color;
    }
}

- (void) setOffset:(NSUInteger)offset {
    if (offset > 100) {
        _offset = 100;
    }
    else {
        _offset = offset;
    }    
}

@end
