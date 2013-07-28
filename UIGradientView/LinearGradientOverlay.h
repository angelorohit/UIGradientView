//
// LinearGradientOverlay.h
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

// The directions in which linear gradients can appear.
typedef enum {
    LinearGradientDirection_Vertical,
    LinearGradientDirection_Horizontal,
    LinearGradientDirection_TopLeftToBottomRight,
    LinearGradientDirection_TopRightToBottomLeft,
    LinearGradientDirection_Max
} LinearGradientDirection;

// LinearGradientOverlay is a subclass of GradientOverlay.
// It can be used to render linear gradients as overlays in
// a UIGradientView.
@interface LinearGradientOverlay : GradientOverlay

// The direction in which this LinearGradientOverlay will
// be rendered.
@property (nonatomic) LinearGradientDirection direction;

@end
