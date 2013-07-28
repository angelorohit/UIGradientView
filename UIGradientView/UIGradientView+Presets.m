//
// UIGradientView+Presets.m
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

#import "UIGradientView+Presets.h"

@implementation UIGradientView (Presets)

- (BOOL) loadPreset:(NSString *)presetName fromFile:(NSString *)filename {
    NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:@"plist"]];
    
    if (dict != nil) {
        NSData * data = [dict objectForKey:presetName];
        if (data != nil) {
            NSArray * gradientOverlays = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            
            if (gradientOverlays != nil) {
                [self setGradientOverlays:gradientOverlays];
                return YES;
            }
        }
    }
    
    return NO;
}

- (BOOL) addPreset:(NSString *)presetName toFile:(NSString *)filename {
    if (_gradientOverlays != nil) {
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:_gradientOverlays];
        if (data != nil) {
            NSString * plistFilePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
            if (plistFilePath != nil) {
                NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:@"plist"]];
                if (dict == nil) {
                    dict = [[NSMutableDictionary alloc] init];
                }
                
                [dict setObject:data forKey:presetName];
                [dict writeToFile:plistFilePath atomically:YES];
                return YES;
            }
        }

    }
    
    return NO;
}

@end
