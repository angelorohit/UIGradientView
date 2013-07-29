//
// UIGradientView+Presets.h
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

// A category of UIGradientView that includes
// support for loading and saving of presets.
@interface UIGradientView (Presets)

// Loads a gradient preset from the specified plist file.
// Returns YES if the load was successful and NO otherwise.
- (BOOL) loadPreset:(NSString *)presetName fromFile:(NSString *)filename;

// Loads a gradient preset from a given NSData object.
// Return YES on success and NO otherwise.
- (BOOL) loadPresetFromData:(NSData *)data;

// Adds the existing gradient overlays in this UIGradientView to a plist file.
// An existing entry in the plist file with the same presetName will be overwritten.
// Returns YES on success and NO otherwise.
- (BOOL) addPreset:(NSString *)presetName toFile:(NSString *)filename;

@end
